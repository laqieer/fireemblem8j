#!/usr/bin/env python3
"""m2c-trust CBMC driver for the 16 FE8J non-matching functions.

Bridge A here is explicitly the m2c-trust tier requested by Cam's framing:
asm/<fn>.s -> m2c reference C, then CBMC over reconstruction C vs reference C.
A PROVEN result is only emitted when CBMC proves the generated C-vs-C harness.
UNKNOWN is emitted only after m2c and a per-function CBMC harness have both been
run and the harness fails closed with a concrete diagnostic.
"""
from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import sys
from dataclasses import asdict, dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CBMC_SPIKE = ROOT.parent
REPO = ROOT.parents[4]
OUT = REPO / "build" / "cbmc_full16"
GEN_REF = ROOT / "generated" / "reference_c"
GEN_HARNESS = ROOT / "generated" / "harnesses"
M2C = REPO / "tools" / "m2c" / "m2c.py"
CTX = REPO / "tools" / "m2c" / "fe8j_ctx.c"

FUNCS = [
    "sub_8001570", "sub_800A34C", "sub_800A594", "sub_800E1FC",
    "sub_800FAD0", "sub_8057F80", "sub_807C8DC", "sub_807D3BC",
    "sub_80A2E64", "sub_80A3300", "sub_80A3528", "sub_80A390C",
    "sub_80A6D34", "sub_80A6E4C", "sub_80A6F1C", "sub_80C05C8",
]
ANCHOR = {"sub_8057F80": "extrapolated-hard", "sub_80A6F1C": "extrapolated-hard"}
COMMON_CBMC_FLAGS = [
    "--bounds-check", "--pointer-check", "--pointer-overflow-check",
    "--div-by-zero-check", "--signed-overflow-check", "--undefined-shift-check",
    "--unwinding-assertions", "--verbosity", "5",
]

@dataclass
class FunctionResult:
    function: str
    verdict: str
    m2c_ran: str
    loop_bound: str
    anchored: str
    evidence: str
    blocker: str
    trust_label: str = "source-level equivalence trusting m2c (spec) + agbcc (codegen)"


def run(cmd: list[str], timeout: int | None = None) -> subprocess.CompletedProcess[str]:
    try:
        return subprocess.run(cmd, cwd=REPO, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout)
    except subprocess.TimeoutExpired as e:
        return subprocess.CompletedProcess(cmd, 124, e.stdout or "", (e.stderr or "") + "\nTIMEOUT")


def find_cbmc() -> str:
    if os.environ.get("CBMC"):
        return os.environ["CBMC"]
    local = REPO / ".cbmc-spike-tools" / "root" / "usr" / "bin" / "cbmc"
    if local.exists():
        return str(local)
    path = shutil.which("cbmc")
    if path:
        return path
    raise SystemExit("CBMC not found; install per cbmc_spike/FINDINGS.md")


def first_label(fn: str) -> str:
    asm = REPO / "asm" / f"{fn}.s"
    for line in asm.read_text(encoding="utf-8", errors="ignore").splitlines():
        if re.match(r"^[A-Za-z_][A-Za-z0-9_]*:", line):
            return line.split(":", 1)[0]
    raise RuntimeError(f"no label in {asm}")


def generate_reference(fn: str) -> tuple[bool, str, Path]:
    GEN_REF.mkdir(parents=True, exist_ok=True)
    label = first_label(fn)
    out = GEN_REF / f"{fn}_ref.c"
    proc = run([sys.executable, str(M2C), "-t", "arm", "--valid-syntax", "--context", str(CTX), "-f", label, str(REPO / "asm" / f"{fn}.s")], timeout=60)
    out.write_text(proc.stdout, encoding="utf-8")
    (GEN_REF / f"{fn}_m2c.stderr.txt").write_text(proc.stderr, encoding="utf-8")
    if proc.returncode != 0 or not proc.stdout.strip():
        return False, f"m2c failed rc={proc.returncode}: {one_line(proc.stderr)}", out
    return True, f"m2c ok label={label}, lines={len(proc.stdout.splitlines())}", out


def write_generic_harness(fn: str, ref: Path) -> Path:
    """A real generated C-vs-C harness skeleton.

    Until a complete observable model profile exists for a function, the harness
    fails closed inside CBMC with an UNKNOWN marker.  This still exercises the
    m2c reference, reconstruction include, CBMC parser, and safety flags.
    """
    GEN_HARNESS.mkdir(parents=True, exist_ok=True)
    h = GEN_HARNESS / f"{fn}_harness.c"
    label = first_label(fn)
    src = f"src/nonmatching/{fn}.c"
    relref = ref.relative_to(REPO)
    ref_externs = []
    for line in ref.read_text(encoding="utf-8", errors="ignore").splitlines():
        if "/* extern */" not in line:
            continue
        m = re.search(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*\(", line)
        if m and m.group(1) != label:
            ref_externs.append(m.group(1))
    ref_externs = sorted(set(ref_externs))
    ref_defines = "\n".join(f"#define {name} refcallee_{name}" for name in ref_externs)
    ref_undefs = "\n".join(f"#undef {name}" for name in reversed(ref_externs))
    h.write_text(f'''#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define {label} impl_{label}
#define subroutine_arg0 impl_subroutine_arg0
#include "{src}"
#undef subroutine_arg0
#undef {label}
#define {label} ref_{label}
#define subroutine_arg0 ref_subroutine_arg0
{ref_defines}
s32 ref_subroutine_arg0;
#include "{relref}"
{ref_undefs}
#undef subroutine_arg0
#undef {label}
int main(void) {{
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for {fn}");
    return 0;
}}
''', encoding="utf-8")
    return h


def classify(proc: subprocess.CompletedProcess[str], unwind: int) -> tuple[str, str]:
    text = (proc.stdout or "") + (proc.stderr or "")
    if proc.returncode == 124:
        return "UNKNOWN", "CBMC timeout"
    if proc.returncode == 0 and "VERIFICATION SUCCESSFUL" in text:
        return "PROVEN", "VERIFICATION SUCCESSFUL"
    if "unwinding assertion" in text and "FAILURE" in text:
        return f"BOUNDED_ONLY_{unwind}", first_detail(text)
    if "UNKNOWN: complete observable model profile" in text:
        return "UNKNOWN", first_detail(text)
    if "VERIFICATION FAILED" in text or "FAILURE" in text:
        return "REFUTED", first_detail(text)
    if "PARSING ERROR" in text or "error:" in text.lower():
        return "UNKNOWN", one_line(text)
    return "UNKNOWN", one_line(text)


def run_cbmc(cbmc: str, harness: Path, unwind: int = 8) -> tuple[str, str]:
    proc = run([cbmc, str(harness), "-I", ".", "-I", "include", "--unwind", str(unwind), *COMMON_CBMC_FLAGS], timeout=90)
    log = OUT / "logs" / f"{harness.stem}.cbmc.txt"
    log.parent.mkdir(parents=True, exist_ok=True)
    log.write_text((proc.stdout or "") + (proc.stderr or ""), encoding="utf-8")
    verdict, detail = classify(proc, unwind)
    return verdict, f"{detail}; log={log.relative_to(REPO)}"


def run_gate(cbmc: str) -> dict[str, object]:
    env = dict(os.environ); env["CBMC"] = cbmc
    proc = subprocess.run([sys.executable, str(CBMC_SPIKE / "run_cbmc_spike.py")], cwd=REPO, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return {"ok": proc.returncode == 0, "stdout": proc.stdout, "stderr": proc.stderr}


def run_mutations(cbmc: str) -> list[dict[str, str]]:
    rows = []
    for name, unwind in [("sub_8001570_mutated_write", 5), ("sub_80A6F1C_mutated_callback", 9)]:
        source = ROOT / "mutations" / f"{name}.c"
        proc = run([cbmc, str(source), "--unwind", str(unwind), *COMMON_CBMC_FLAGS])
        verdict, detail = classify(proc, unwind)
        rows.append({"case": name, "expected": "REFUTED", "observed": verdict, "detail": detail})
    return rows


def first_detail(text: str) -> str:
    for line in text.splitlines():
        if "FAILURE" in line or "VERIFICATION SUCCESSFUL" in line or "VERIFICATION FAILED" in line:
            return line.strip()
    return one_line(text)


def one_line(text: str) -> str:
    for line in text.splitlines():
        s = line.strip()
        if s:
            return s[:220]
    return "no diagnostic"


def process_function(cbmc: str, fn: str) -> FunctionResult:
    ok, m2c_msg, ref = generate_reference(fn)
    anchored = ANCHOR.get(fn, "anchored-known-equivalent")
    if not ok:
        return FunctionResult(fn, "UNKNOWN", "no", "n/a", anchored, m2c_msg, m2c_msg)
    special = ROOT / "harnesses" / f"{fn}_cbmc.c"
    if special.exists():
        verdict, evidence = run_cbmc(cbmc, special, unwind=260 if fn == "sub_80A3300" else 32)
        loop = "--unwind 260 + unwinding assertions" if fn == "sub_80A3300" else "--unwind 32 + unwinding assertions"
        return FunctionResult(fn, verdict, "yes", loop, anchored, m2c_msg + "; " + evidence, evidence)
    harness = write_generic_harness(fn, ref)
    verdict, evidence = run_cbmc(cbmc, harness)
    return FunctionResult(fn, verdict, "yes", "--unwind 8 + unwinding assertions", anchored, m2c_msg + "; " + evidence, evidence)


def write_outputs(gate: dict[str, object], mutations: list[dict[str, str]], results: list[FunctionResult]) -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "results.json").write_text(json.dumps({"gate": gate, "mutations": mutations, "results": [asdict(r) for r in results]}, indent=2) + "\n", encoding="utf-8")
    proven = sum(r.verdict == "PROVEN" for r in results)
    anchored_proven = sum(r.verdict == "PROVEN" and r.anchored == "anchored-known-equivalent" for r in results)
    lines = [
        "# CBMC full16 findings\n\n",
        "Label for every result: **source-level equivalence trusting m2c (spec) + agbcc (codegen)**.\n\n",
        f"Headline: **{proven}/16 CBMC-PROVEN via Cam's approach (m2c-trust tier); of which {anchored_proven} anchored-confirmed on known-equivalent**.\n\n",
        "## Trust gate\n\n",
        f"- adversarial/Q2a gate: {'PASS' if gate['ok'] else 'FAIL'}\n\n",
        "```text\n" + str(gate["stdout"]).strip() + "\n```\n\n",
        "## Mutation smoke checks\n\n| case | expected | observed | detail |\n| --- | --- | --- | --- |\n",
    ]
    for row in mutations:
        lines.append(f"| {row['case']} | {row['expected']} | {row['observed']} | {row['detail']} |\n")
    lines.append("\n## Per-function verdicts\n\n| function | verdict | m2c-ran | loop-bound | anchored/extrapolated | evidence | blocker |\n| --- | --- | --- | --- | --- | --- | --- |\n")
    for r in results:
        lines.append(f"| `{r.function}` | {r.verdict} | {r.m2c_ran} | {r.loop_bound} | {r.anchored} | {r.evidence} | {r.blocker} |\n")
    lines.append("\n## Notes\n\nThe bridge now runs m2c for every function and builds a CBMC C-vs-C harness for every generated reference. A function is still fail-closed unless a complete observable model profile exists for its visible writes/calls. Current generated generic harnesses deliberately assert an UNKNOWN marker when that profile is absent; see `build/cbmc_full16/logs/` for exact CBMC output.\n")
    (ROOT / "FINDINGS_full16.md").write_text("".join(lines), encoding="utf-8")


def main() -> int:
    cbmc = find_cbmc()
    gate = run_gate(cbmc)
    mutations = run_mutations(cbmc)
    results = [process_function(cbmc, fn) for fn in FUNCS]
    write_outputs(gate, mutations, results)
    print(f"CBMC: {subprocess.check_output([cbmc, '--version'], text=True).strip()}")
    print(f"gate={'PASS' if gate['ok'] else 'FAIL'}")
    for row in mutations:
        print(f"mutation {row['case']}: expected {row['expected']} observed {row['observed']}")
    print(f"PROVEN={sum(r.verdict == 'PROVEN' for r in results)}/16")
    print(f"wrote {ROOT / 'FINDINGS_full16.md'}")
    return 0 if gate["ok"] and all(r["observed"] == r["expected"] for r in mutations) else 1

if __name__ == "__main__":
    sys.exit(main())
