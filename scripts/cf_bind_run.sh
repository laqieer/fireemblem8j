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
    grep -q "^OK: " "/tmp/cf_${tu}.log" || { echo "[$tu] no graduates / not green — skipping commit"; \
        # ensure tree is clean+green even on a 'no graduate' batch
        rm -f src/*.s; make compare >/dev/null 2>&1; assert_rom || exit 1; continue; }
    rm -f src/*.s
    if ! make compare 2>&1 | tail -1 | grep -q OK; then
        echo "[$tu] make compare NOT OK after batch — recovering";
        git checkout -- asm/ layout/ src/ 2>/dev/null; rm -f src/*.s; make compare >/dev/null 2>&1; continue
    fi
    assert_rom || exit 1
    # stage: new src/*.c (untracked carves), this TU's cfbind frags, dedup frag,
    # asm deletions + gbadisasm frag deletions.
    git add src/ 2>/dev/null
    git add "layout/baseline_syms.d/cfbind_${tu}.tsv" \
            "layout/carved_rom.d/cfbind_${tu}.tsv" \
            "layout/carved_ram.d/cfbind_${tu}.tsv" \
            "layout/patches.d/cfbind_${tu}.tsv" \
            "layout/baseline_syms_drop.d/cfbind_${tu}.tsv" \
            layout/baseline_syms_drop.d/cfbind_dedup.tsv 2>/dev/null
    git add -u asm/ layout/carved_rom.d/ layout/carved_ram.d/ layout/patches.d/ layout/baseline_syms.d/ layout/baseline_syms_drop.d/ 2>/dev/null
    n=$(grep "^OK: " "/tmp/cf_${tu}.log" | grep -oE '\+[0-9]+' | head -1)
    git commit -q -m "feat(cfBind): ${n} ${tu} — CF:agbcc data-bind (bind TU-private ProcScr/lookup tables)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>" \
        && echo "[$tu] committed ${n}" || echo "[$tu] nothing to commit"
    assert_rom || exit 1
    git push -q origin feat/cfBind 2>&1 | tail -1
done
echo "===================== cf_bind_run DONE ====================="
