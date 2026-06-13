#!/usr/bin/env python3
"""Wave-health dashboard — RUN EVERY LOOP TICK while agents are dispatched.

Prevents the 2026-06-13 "7-hour stall": agents were alive but low-yield, and the
orchestrator waited for *completion* instead of integrating their incremental
commits, so `main` did not advance for hours. This turns passive watching into
active "integrate-on-cadence + catch low-yield early".

It answers, in one shot:
  - how long since `main` last advanced (the number that actually matters),
  - which `origin/feat/*` branches have UNINTEGRATED commits (-> merge them now),
  - per-branch yield-rate (commits/hour since first commit) -> flag thrashers,
  - which carve levers are EXHAUSTED (don't re-dispatch them — the stall's root cause).

Exit non-zero if action is needed (main stale with work waiting, or a thrasher),
so a loop can `python3 scripts/wave_status.py || <intervene>`.
"""
import os
import subprocess
import sys
import time

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Levers already exhausted by prior waves — re-dispatching these wastes hours
# (each new wave must EXTEND this list as it exhausts a lever, in docs/decisions.md).
EXHAUSTED = {
    "perm2 reloc-resolve (addr < 0x8067584)": "mcMechLo D83-era / constScaleLo confirmed near-zero",
    "perm2 reloc-resolve (addr >= 0x8067584)": "mcHi2 D83 swept it",
    "perfrag region-same (both halves)": "harvAM/harvNZ/mcMechLo/mcHi2",
    "CF:agbcc bind_tu (funcmap functions)": "cfBind D67 swept the funcmap set",
    "const_diff_carve.py --min 200 (FAR >200B band)": "cdLarge D86: 0/424 land — residue is data-table-dependent, not inline-literal",
}
# Levers still productive (dispatch THESE):
PRODUCTIVE = [
    "const_diff_carve.py on the SMALL FAR const-diff residue (<=200B inline-literal band) ONLY (D81/D84/D86) — the live matching-C lever",
    "typed-data: pure-const-array US TUs in src/*.c (not src/data/*.c graphics wrappers) — m4a_tables.c pattern",
    "NAME-data byte-neutral renaming (needs /tmp/us_syms.tsv built from fe8u map first)",
    "decomp-permuter for the TRUE codegen-shape FAR (minority) + delta-transfer",
]

STALE_MIN = 45        # main not advanced this long + work waiting => integrate now
THRASH_HRS = 2.0      # a branch alive >this with <2 commits => low-yield, re-target


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True).stdout.strip()


def main():
    sh("git fetch origin --quiet")
    now = int(time.time())
    main_sha = sh("git rev-parse --short origin/main")
    main_ct = int(sh("git log -1 --format=%ct origin/main") or now)
    main_age = (now - main_ct) // 60
    print(f"=== WAVE STATUS === origin/main={main_sha}  (last advanced {main_age} min ago)")

    branches = [b.strip() for b in sh("git branch -r --list 'origin/feat/*'").splitlines() if b.strip()]
    stale = main_age > STALE_MIN
    integrate, thrash = [], []
    any_work = False
    for b in branches:
        name = b.replace("origin/", "")
        n = sh(f"git rev-list --count origin/main..{b}")
        if not n or n == "0":
            continue
        any_work = True
        n = int(n)
        first_ct = int(sh(f"git log --reverse --format=%ct origin/main..{b} | head -1") or now)
        last_cr = sh(f"git log -1 --format=%cr {b}")
        hrs = max((now - first_ct) / 3600.0, 0.01)
        rate = n / hrs
        flag = ""
        if (n >= 1 and stale) or n >= 3:
            integrate.append(name)
            flag = "  <-- INTEGRATE NOW"
        if hrs > THRASH_HRS and n < 2:
            thrash.append(name)
            flag += "  <-- LOW-YIELD: inspect/re-target"
        print(f"  {name}: {n} unintegrated, {rate:.1f} commits/hr, last {last_cr}{flag}")

    if stale and not any_work:
        print("  !! main STALE and NO unintegrated branch commits — agents producing NOTHING.")
        print("     Inspect agent logs; likely re-dispatched an EXHAUSTED lever. Re-target.")

    print("\n--- EXHAUSTED levers (do NOT re-dispatch) ---")
    for k, v in EXHAUSTED.items():
        print(f"  x {k}  ({v})")
    print("--- PRODUCTIVE levers (dispatch these) ---")
    for p in PRODUCTIVE:
        print(f"  > {p}")

    action = bool(integrate) or bool(thrash) or (stale and not any_work)
    if integrate:
        print(f"\n>>> ACTION: integrate {', '.join(integrate)} NOW (do not wait for agent completion).")
    if thrash:
        print(f">>> ACTION: {', '.join(thrash)} are low-yield (>2h, <2 commits) — inspect + stop/re-target.")
    return 1 if action else 0


if __name__ == "__main__":
    sys.exit(main())
