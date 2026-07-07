#!/usr/bin/env python3
"""Audit (and optionally fix) layout/us_jp_funcmap.tsv against the JP decomp ELF.

WHY: match_us_jp.py pairs a US function to a JP address by byte-identity. For
TINY accessors (e.g. `ldr r0,=G; ldr r0,[r0]; bx lr`) the ONLY distinguishing
byte is the literal-pool word (the global they touch). Across the JP<->US region
shift a US global address can coincidentally equal a *different* JP global's
address, so the "exact" tier matches a US function to the WRONG JP function
(byte-identical by accident). This mislabels the funcmap and makes carvers port
the wrong US source -> `make compare` mismatch (this bit `sub_8057F80`: JP
0x08050AC8 was labeled GetSelectTargetCount but is GetBanimLinkArenaFlag; and the
whole GetEkrHit/Dmg/Crit gauge-getter chain was shifted by one).

GROUND TRUTH: the JP decomp ELF (`fireemblem8.elf`) names each address from real
`src/` carves (independent of the funcmap). Where a function has an authoritative
carved name that differs from the funcmap AND that name is a real US symbol
(present in the US ELF), the carve wins: rewrite the funcmap row to (jp_addr,
US_addr_of_carved_name, size, "fixup", carved_name).

This auditor is RE-RUNNABLE: run it after any `match_us_jp.py` regeneration to
re-apply the reconciliation (the coincidental swaps recur otherwise).

Usage:
  scripts/tools/audit_funcmap.py               # report (dry-run)
  scripts/tools/audit_funcmap.py --fix         # apply FIXABLE corrections
  scripts/tools/audit_funcmap.py --show-review # also list REVIEW-only (data blobs)
"""
import argparse
import os
import subprocess
import sys

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
FUNCMAP = os.path.join(REPO, "layout", "us_jp_funcmap.tsv")
JP_ELF = os.path.join(REPO, "fireemblem8.elf")
US_ELF = os.environ.get("FE8U_ELF", "/home/laqieer/fireemblem8u/fireemblem8.elf")

PLACEHOLDER_PREitems = ("sub_", "data_", "nullsub", "j_", "__", "_0", ".L",
                        ".gcc2", "frontier_", "REDAs_", "unk_", "Unk_")


def nm_names(elf, types="tT"):
    """addr(int) -> list[name], for symbols of the given nm type letters."""
    out = subprocess.run(["arm-none-eabi-nm", "-n", elf],
                         capture_output=True, text=True).stdout.splitlines()
    m = {}
    for ln in out:
        p = ln.split()
        if len(p) != 3:
            continue
        a, t, n = p
        if t not in types:
            continue
        try:
            m.setdefault(int(a, 16), []).append(n)
        except ValueError:
            pass
    return m


def is_placeholder(n):
    return n.startswith(PLACEHOLDER_PREitems)


def real_name(names):
    for n in names:
        if not is_placeholder(n):
            return n
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--fix", action="store_true")
    ap.add_argument("--show-review", action="store_true")
    args = ap.parse_args()

    for f in (FUNCMAP, JP_ELF, US_ELF):
        if not os.path.exists(f):
            sys.exit(f"missing: {f} (build fireemblem8.elf; set FE8U_ELF if needed)")

    jp_names = nm_names(JP_ELF, "tTdDbBrR")           # all defined symbols
    us_all = subprocess.run(["arm-none-eabi-nm", "-n", US_ELF],
                            capture_output=True, text=True).stdout.splitlines()
    us_by_name = {}                                   # name -> (addr, is_code)
    for ln in us_all:
        p = ln.split()
        if len(p) == 3 and p[1] in "tTdDbBrR":
            us_by_name.setdefault(p[2], (int(p[0], 16), p[1] in "tT"))

    lines = open(FUNCMAP).read().split("\n")
    fixable, review = [], []
    out_lines = []
    for ln in lines:
        if ln.startswith("#") or not ln.strip():
            out_lines.append(ln)
            continue
        p = ln.split("\t")
        if len(p) < 5:
            out_lines.append(ln)
            continue
        jp = int(p[0], 16)
        fmname = p[4]
        elf = real_name(jp_names.get(jp, []))
        if not elf or elf == fmname:
            out_lines.append(ln)
            continue
        us = us_by_name.get(elf)
        # FIXABLE (code): the authoritative carved name is a real US FUNCTION.
        # Data/proc/event carve-name differences are reported for manual review
        # (byte-match of data is less reliable AND naming there is often a carve
        # placeholder, not a cleaner ID -- don't auto-rewrite).
        if us is not None and us[1]:
            us_a = us[0]
            fixable.append((p[0], p[1], p[2], p[3], fmname, f"{us_a:08X}", elf))
            out_lines.append(f"{p[0]}\t{us_a:08X}\t{p[2]}\tfixup\t{elf}")
        else:
            why = "data-sym" if us is not None else "no-US-sym"
            review.append((p[0], p[1], p[3], fmname, elf, why))
            out_lines.append(ln)

    print(f"FIXABLE code-function swaps (carved name is a real US FUNCTION): "
          f"{len(fixable)}")
    for jp, us, sz, tier, fm, newus, elf in fixable:
        print(f"  JP {jp}  {tier:6s}  {fm:34s} -> {elf}  (us {us}->{newus})")
    print(f"\nREVIEW-only (data/proc/event carve-name vs funcmap): {len(review)}")
    if args.show_review:
        for jp, us, tier, fm, elf, why in review:
            print(f"  [{why:9s}] JP {jp}  {tier:6s}  funcmap={fm:32s} ELF={elf}")

    if args.fix:
        # de-dup rows that now collide on (jp_addr, name)
        seen = set()
        deduped = []
        for ln in out_lines:
            p = ln.split("\t")
            key = (p[0], p[-1]) if len(p) >= 5 and not ln.startswith("#") else ln
            if key in seen and len(p) >= 5:
                continue
            seen.add(key)
            deduped.append(ln)
        open(FUNCMAP, "w").write("\n".join(deduped))
        print(f"\nAPPLIED {len(fixable)} fixups to {FUNCMAP} (tier=fixup).")
    else:
        print("\n(dry-run) re-run with --fix to apply the FIXABLE corrections.")


if __name__ == "__main__":
    main()
