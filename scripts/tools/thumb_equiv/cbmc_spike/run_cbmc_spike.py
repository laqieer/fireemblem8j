#!/usr/bin/env python3
"""Run the scoped CBMC equivalence spike.

The script intentionally reports only the fail-closed verdict vocabulary used by
FINDINGS.md: PROVEN, REFUTED, UNKNOWN, and BOUNDED_ONLY_N.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[3]

COMMON_FLAGS = [
    "--bounds-check",
    "--pointer-check",
    "--pointer-overflow-check",
    "--div-by-zero-check",
    "--signed-overflow-check",
    "--undefined-shift-check",
    "--unwinding-assertions",
    "--verbosity",
    "5",
]


@dataclass(frozen=True)
class Case:
    name: str
    source: Path
    expected: str
    unwind: int = 4
    unknown_on_refute: bool = False


CASES = [
    Case("gate.identical", ROOT / "adversarial" / "identical.c", "PROVEN"),
    Case("gate.return_plus_one", ROOT / "adversarial" / "return_plus_one.c", "REFUTED"),
    Case("gate.helper_args_differ", ROOT / "adversarial" / "helper_args_differ.c", "REFUTED"),
    Case("gate.omitted_write", ROOT / "adversarial" / "omitted_write.c", "REFUTED"),
    Case("gate.pointer_alias_global", ROOT / "adversarial" / "pointer_alias_global.c", "REFUTED"),
    Case("gate.same_return_diff_global", ROOT / "adversarial" / "same_return_diff_global.c", "REFUTED"),
    Case("gate.shared_oracle_same_args", ROOT / "adversarial" / "shared_oracle_same_args.c", "PROVEN"),
    Case("gate.loop_unwind", ROOT / "adversarial" / "loop_unwind.c", "BOUNDED_ONLY_2", unwind=2),
    Case(
        "gate.unmodeled_pointer_unknown",
        ROOT / "adversarial" / "unmodeled_pointer_unknown.c",
        "UNKNOWN",
        unknown_on_refute=True,
    ),
    Case("q2a.GetGameClock", ROOT / "q2a" / "get_game_clock.c", "PROVEN"),
    Case("q2a.AddTarget", ROOT / "q2a" / "add_target.c", "PROVEN", unwind=9),
    Case("q2a.GreenText_OnLoop", ROOT / "q2a" / "green_text_on_loop.c", "PROVEN", unwind=33),
]


def find_cbmc() -> str:
    env = os.environ.get("CBMC")
    if env:
        return env
    path = shutil.which("cbmc")
    if path:
        return path
    local = REPO / ".cbmc-spike-tools" / "root" / "usr" / "bin" / "cbmc"
    if local.exists():
        return str(local)
    raise SystemExit("CBMC not found; set CBMC=/path/to/cbmc or install cbmc")


def classify(case: Case, proc: subprocess.CompletedProcess[str]) -> str:
    out = proc.stdout + proc.stderr
    if proc.returncode == 0 and "VERIFICATION SUCCESSFUL" in out:
        return "PROVEN"
    if "unwinding assertion" in out and "FAILURE" in out:
        return f"BOUNDED_ONLY_{case.unwind}"
    if case.unknown_on_refute and proc.returncode != 0:
        return "UNKNOWN"
    if proc.returncode != 0 and ("VERIFICATION FAILED" in out or "FAILURE" in out):
        return "REFUTED"
    return "UNKNOWN"


def run_case(cbmc: str, case: Case) -> tuple[str, str]:
    cmd = [cbmc, str(case.source), "--unwind", str(case.unwind), *COMMON_FLAGS]
    proc = subprocess.run(cmd, cwd=REPO, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    verdict = classify(case, proc)
    detail = ""
    for line in (proc.stdout + proc.stderr).splitlines():
        if "FAILURE" in line or "VERIFICATION SUCCESSFUL" in line or "VERIFICATION FAILED" in line:
            detail = line.strip()
            break
    return verdict, detail


def main() -> int:
    cbmc = find_cbmc()
    print(f"CBMC: {subprocess.check_output([cbmc, '--version'], text=True).strip()}")
    print("| case | expected | observed | detail |")
    print("| --- | --- | --- | --- |")
    ok = True
    for case in CASES:
        verdict, detail = run_case(cbmc, case)
        ok = ok and verdict == case.expected
        print(f"| {case.name} | {case.expected} | {verdict} | {detail} |")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
