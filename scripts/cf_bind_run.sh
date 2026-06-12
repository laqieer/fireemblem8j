#!/bin/bash
# cf_bind_run.sh — batch-carve a list of TUs (CF:agbcc lever), gate + commit + push
# each TU that yields. Run from the worktree root. Never `git add -A`.
set -u
WT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$WT"

assert_rom() {
    local sz; sz=$(stat -c%s fireemblem8.gba 2>/dev/null || echo 0)
    if [ "$sz" != "16777216" ]; then
        echo "FATAL: ROM size $sz != 16777216 — aborting"; return 1
    fi; return 0
}

for tu in "$@"; do
    echo "===================== TU: $tu ====================="
    rm -f src/*.s
    # snapshot the committed src set so we can stage only NEW carves
    git ls-files src/ > /tmp/cf_pre_src.txt
    python3 scripts/cf_bind_drive.py --batch --tu "$tu" 2>&1 | tee "/tmp/cf_${tu}.log" | tail -4
    # FULL restore-to-HEAD helper: clean every untracked cfbind/gap artifact + any
    # reverted/leftover src, restore tracked asm/layout/src/data, rebuild. Never aborts.
    restore_head() {
        git checkout -- asm/ layout/ src/ data/ include/ 2>/dev/null
        git clean -fq "layout/carved_rom.d/cfbind_${tu}.tsv" "layout/carved_ram.d/cfbind_${tu}.tsv" \
            "layout/patches.d/cfbind_${tu}.tsv" "layout/baseline_syms.d/cfbind_${tu}.tsv" \
            "layout/baseline_syms_drop.d/cfbind_${tu}.tsv" 2>/dev/null
        # drop any untracked src created by this TU's batch (not in pre-snapshot)
        comm -13 /tmp/cf_pre_src.txt <(git ls-files --others --exclude-standard src/ | sort) 2>/dev/null | xargs -r rm -f
        rm -f src/*.s; make layout >/dev/null 2>&1; make compare >/dev/null 2>&1
    }
    if ! grep -q "^OK: " "/tmp/cf_${tu}.log"; then
        echo "[$tu] no graduates / not green — restoring to HEAD"; restore_head
        if ! make compare 2>&1 | tail -1 | grep -q OK; then echo "[$tu] WARN: still not green after restore"; fi
        continue
    fi
    rm -f src/*.s
    if ! make compare 2>&1 | tail -1 | grep -q OK; then
        echo "[$tu] make compare NOT OK after batch — restoring to HEAD"; restore_head; continue
    fi
    assert_rom || { echo "[$tu] ROM bad after batch — restoring"; restore_head; continue; }
    # close any baserom gaps the asm->C swap opened (self-containment), so each TU
    # commit stays at 0 incbins. Byte-identical by construction; re-verify compare.
    rm -f src/*.s
    if python3 scripts/check_selfcontained.py 2>&1 | grep -q "NOT YET"; then
        python3 scripts/close_baserom_gaps.py >/dev/null 2>&1
        rm -f src/*.s; make layout >/dev/null 2>&1
        if ! make compare 2>&1 | tail -1 | grep -q OK; then
            echo "[$tu] gap-close broke compare — recovering"; \
            git checkout -- asm/ layout/ src/ data/ 2>/dev/null; \
            git clean -fq asm/gap_*.s data/residual/ 2>/dev/null; \
            rm -f src/*.s; make compare >/dev/null 2>&1; continue
        fi
        git add asm/gap_*.s data/residual/gap_*.bin layout/carved_rom.d/residual_gaps.tsv 2>/dev/null
        assert_rom || exit 1
    fi
    # stage: new src/*.c (untracked carves), this TU's cfbind frags, dedup frag,
    # asm deletions + gbadisasm frag deletions.
    git add src/ 2>/dev/null
    # add each fragment INDIVIDUALLY: a multi-pathspec `git add` aborts atomically
    # (rc=128, stages nothing) if ANY path is missing — and a TU with no region-diff
    # rodata has no carved_ram fragment. Add only the ones that exist.
    for f in "layout/baseline_syms.d/cfbind_${tu}.tsv" \
             "layout/carved_rom.d/cfbind_${tu}.tsv" \
             "layout/carved_ram.d/cfbind_${tu}.tsv" \
             "layout/patches.d/cfbind_${tu}.tsv" \
             "layout/baseline_syms_drop.d/cfbind_${tu}.tsv" \
             "layout/baseline_syms_drop.d/cfbind_dedup.tsv"; do
        [ -f "$f" ] && git add "$f"
    done
    git add -u asm/ layout/carved_rom.d/ layout/carved_ram.d/ layout/patches.d/ layout/baseline_syms.d/ layout/baseline_syms_drop.d/ 2>/dev/null
    n=$(grep "^OK: " "/tmp/cf_${tu}.log" | grep -oE '\+[0-9]+' | head -1)
    git commit -q -m "feat(cfBind): ${n} ${tu} — CF:agbcc data-bind (bind TU-private ProcScr/lookup tables)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>" \
        && echo "[$tu] committed ${n}" || echo "[$tu] nothing to commit"
    assert_rom || exit 1
    git push -q origin feat/cfBind 2>&1 | tail -1
done
echo "===================== cf_bind_run DONE ====================="
