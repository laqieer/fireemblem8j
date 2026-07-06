#!/usr/bin/env python3
"""Fail-closed CBMC driver for the 16 FE8J non-matching functions.

This is intentionally conservative.  A function is reported PROVEN only when a
mechanical ASM-to-C bridge exists and has been validated before the C-vs-spec
CBMC harness is accepted.  The current repository has the adversarial CBMC gate
and Q2(a) C-vs-C examples, but it does not yet have either:

  * validated reference-C files for these 16 functions, or
  * a cfg_exec -> CBMC observable emitter.

Therefore this driver records the exact blocker per function rather than
manufacturing a vacuous proof.  It also runs mutation smoke harnesses to keep the
CBMC assertion plumbing honest.
"""

from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
from dataclasses import dataclass, asdict
from pathlib import Path


ROOT = Path(__file__).resolve().parent
CBMC_SPIKE = ROOT.parent
REPO = ROOT.parents[4]
OUT = REPO / "build" / "cbmc_full16"

FUNCS = [
    "sub_8001570",
    "sub_800A34C",
    "sub_800A594",
    "sub_800E1FC",
    "sub_800FAD0",
    "sub_8057F80",
    "sub_807C8DC",
    "sub_807D3BC",
    "sub_80A2E64",
    "sub_80A3300",
    "sub_80A3528",
    "sub_80A390C",
    "sub_80A6D34",
    "sub_80A6E4C",
    "sub_80A6F1C",
    "sub_80C05C8",
]

KNOWN_REFERENCE = {
    "sub_8001570": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_800A34C": "differential-EQUIV only; ARM-vs-ARM DIVERGENCE",
    "sub_800A594": "ARM-vs-ARM PROVEN-BOUNDED(1)",
    "sub_800E1FC": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_800FAD0": "differential-EQUIV only; ARM-vs-ARM UNKNOWN/path-explosion",
    "sub_8057F80": "live harness 114/115 writes; not equivalent",
    "sub_807C8DC": "ARM-vs-ARM PROVEN-BOUNDED(2)",
    "sub_807D3BC": "ARM-vs-ARM PROVEN-BOUNDED(1)",
    "sub_80A2E64": "ARM-vs-ARM PROVEN-BOUNDED(1)",
    "sub_80A3300": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_80A3528": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_80A390C": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_80A6D34": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_80A6E4C": "ARM-vs-ARM PROVEN-BOUNDED(3)",
    "sub_80A6F1C": "DIVERGENCE/INCONCLUSIVE-CB; callback stack escape",
    "sub_80C05C8": "ARM-vs-ARM PROVEN-BOUNDED(2)",
}

COMMON_CBMC_FLAGS = [
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


@dataclass
class FunctionResult:
    function: str
    verdict: str
    bridge: str
    loop_bound: str
    evidence: str
    blocker: str
    trust_label: str = "source-level equivalence under modeled C semantics, trusting agbcc codegen/ABI"


def find_cbmc() -> str:
    env = os.environ.get("CBMC")
    if env:
        return env
    local = REPO / ".cbmc-spike-tools" / "root" / "usr" / "bin" / "cbmc"
    if local.exists():
        return str(local)
    path = shutil.which("cbmc")
    if path:
        return path
    raise SystemExit("CBMC not found; set CBMC=... or install per cbmc_spike/FINDINGS.md")


def run(cmd: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, cwd=REPO, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def classify_cbmc(proc: subprocess.CompletedProcess[str], unwind: int) -> str:
    out = proc.stdout + proc.stderr
    if proc.returncode == 0 and "VERIFICATION SUCCESSFUL" in out:
        return "PROVEN"
    if "unwinding assertion" in out and "FAILURE" in out:
        return f"BOUNDED_ONLY_{unwind}"
    if proc.returncode != 0 and ("VERIFICATION FAILED" in out or "FAILURE" in out):
        return "REFUTED"
    return "UNKNOWN"


def run_gate(cbmc: str) -> dict[str, object]:
    env = dict(os.environ)
    env["CBMC"] = cbmc
    proc = subprocess.run(
        [sys.executable, str(CBMC_SPIKE / "run_cbmc_spike.py")],
        cwd=REPO,
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return {
        "ok": proc.returncode == 0,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def run_mutations(cbmc: str) -> list[dict[str, str]]:
    cases = [
        ("sub_8001570_mutated_write", ROOT / "mutations" / "sub_8001570_mutated_write.c", 5),
        ("sub_80A6F1C_mutated_callback", ROOT / "mutations" / "sub_80A6F1C_mutated_callback.c", 9),
    ]
    rows = []
    for name, source, unwind in cases:
        proc = run([cbmc, str(source), "--unwind", str(unwind), *COMMON_CBMC_FLAGS])
        rows.append(
            {
                "case": name,
                "expected": "REFUTED",
                "observed": classify_cbmc(proc, unwind),
                "detail": first_detail(proc.stdout + proc.stderr),
            }
        )
    return rows


def first_detail(text: str) -> str:
    for line in text.splitlines():
        if "FAILURE" in line or "VERIFICATION SUCCESSFUL" in line or "VERIFICATION FAILED" in line:
            return line.strip()
    return ""


def bridge_status(fn: str) -> FunctionResult:
    ref_c = ROOT / "reference_c" / f"{fn}_ref.c"
    spec_c = ROOT / "harnesses" / f"{fn}_cfg_exec_spec.c"
    candidate = REPO / "src" / "nonmatching" / f"{fn}.c"
    asm = REPO / "asm" / f"{fn}.s"

    missing = []
    if not candidate.exists():
        missing.append(f"missing {candidate.relative_to(REPO)}")
    if not asm.exists():
        missing.append(f"missing {asm.relative_to(REPO)}")
    if missing:
        return FunctionResult(
            fn,
            "UNKNOWN",
            "preflight",
            "n/a",
            "preflight failed",
            "; ".join(missing),
        )

    if ref_c.exists():
        return FunctionResult(
            fn,
            "UNKNOWN",
            "Bridge A candidate present but not validated",
            "not run",
            f"found {ref_c.relative_to(REPO)}",
            "reference-C validation to ASM is not implemented in this fail-closed driver",
        )

    if spec_c.exists():
        return FunctionResult(
            fn,
            "UNKNOWN",
            "Bridge B candidate present but not validated",
            "not run",
            f"found {spec_c.relative_to(REPO)}",
            "cfg_exec-derived spec harness exists but no validator has certified complete write/call footprint",
        )

    return FunctionResult(
        fn,
        "UNKNOWN",
        "none",
        "n/a",
        KNOWN_REFERENCE.get(fn, "no prior reference result recorded"),
        "No validated reference-C and no cfg_exec-derived CBMC observable emitter; fail-closed instead of proving against hand-picked writes.",
    )


def write_outputs(gate: dict[str, object], mutations: list[dict[str, str]], results: list[FunctionResult]) -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    payload = {
        "gate": gate,
        "mutations": mutations,
        "results": [asdict(r) for r in results],
    }
    (OUT / "results.json").write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    proven = sum(1 for r in results if r.verdict == "PROVEN")

    lines = []
    lines.append("# CBMC full16 findings\n")
    lines.append("All verdicts are fail-closed and labelled: **source-level equivalence under modeled C semantics, trusting agbcc codegen/ABI**.\n")
    lines.append(f"Headline: **{proven}/16 CBMC-PROVEN via Cam's approach**.\n")
    lines.append("## Trust gate\n")
    lines.append(f"- adversarial/Q2a gate: {'PASS' if gate['ok'] else 'FAIL'}\n")
    lines.append("```text\n" + str(gate["stdout"]).strip() + "\n```\n")
    lines.append("## Mutation smoke checks\n")
    lines.append("| case | expected | observed | detail |\n| --- | --- | --- | --- |\n")
    for row in mutations:
        lines.append(f"| {row['case']} | {row['expected']} | {row['observed']} | {row['detail']} |\n")
    lines.append("\n## Per-function verdicts\n")
    lines.append("| function | verdict | bridge | loop bound | evidence | blocker |\n| --- | --- | --- | --- | --- | --- |\n")
    for r in results:
        lines.append(
            f"| `{r.function}` | {r.verdict} | {r.bridge} | {r.loop_bound} | {r.evidence} | {r.blocker} |\n"
        )
    lines.append(
        "\n## Summary\n\n"
        "The CBMC harness infrastructure is live and rejects adversarial mutations, but the requested mechanical ASM-spec bridge is still absent for all 16 functions. "
        "Reporting PROVEN would require either a validated reference-C file per function (Bridge A) or a cfg_exec-derived CBMC observable with complete write/call footprint (Bridge B). "
        "Neither artifact exists yet, so every function remains UNKNOWN under Cam's CBMC approach rather than being false-proven.\n"
    )
    (ROOT / "FINDINGS_full16.md").write_text("".join(lines), encoding="utf-8")


def main() -> int:
    cbmc = find_cbmc()
    gate = run_gate(cbmc)
    mutations = run_mutations(cbmc)
    results = [bridge_status(fn) for fn in FUNCS]
    write_outputs(gate, mutations, results)

    ok = gate["ok"] and all(row["observed"] == row["expected"] for row in mutations)
    print(f"CBMC: {subprocess.check_output([cbmc, '--version'], text=True).strip()}")
    print(f"gate={'PASS' if gate['ok'] else 'FAIL'}")
    for row in mutations:
        print(f"mutation {row['case']}: expected {row['expected']} observed {row['observed']}")
    print(f"PROVEN={sum(1 for r in results if r.verdict == 'PROVEN')}/16")
    print(f"wrote {ROOT / 'FINDINGS_full16.md'}")
    print(f"wrote {OUT / 'results.json'}")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
