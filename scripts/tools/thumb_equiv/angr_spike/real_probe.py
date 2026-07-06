#!/usr/bin/env python3
from __future__ import annotations

import re
import subprocess
import sys
import signal
from pathlib import Path

from checker import Program, check_equiv

ROOT = Path(__file__).resolve().parents[4]
BUILD = ROOT / "build" / "angr_spike" / "real"
ROM_BASE = 0x08000000


def run(argv):
    r = subprocess.run(argv, cwd=ROOT, text=True, capture_output=True)
    if r.returncode != 0:
        raise RuntimeError(f"failed: {' '.join(map(str, argv))}\n{r.stdout}\n{r.stderr}")
    return r.stdout


def text_size(obj):
    out = run(["arm-none-eabi-objdump", "-h", str(obj)])
    size = 0
    for line in out.splitlines():
        m = re.search(r"\s\d+\s+(\.text\S*)\s+([0-9a-fA-F]{8})", line)
        if m:
            size = max(size, int(m.group(2), 16))
    return size


def assemble_target(fn):
    BUILD.mkdir(parents=True, exist_ok=True)
    asm = ROOT / "asm" / f"{fn}.s"
    obj = BUILD / f"{fn}.target.o"
    run(["arm-none-eabi-as", "-mthumb", "-mcpu=arm7tdmi", str(asm), "-o", str(obj)])
    return text_size(obj)


def pick_symbol(obj, target_size):
    out = run(["arm-none-eabi-nm", "--print-size", str(obj)])
    best = None
    for line in out.splitlines():
        m = re.match(r"^([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+[tT]\s+(\S+)", line)
        if m:
            off, sz = int(m.group(1), 16), int(m.group(2), 16)
            if best is None or abs(sz - target_size) < abs(best[1] - target_size):
                best = (off, sz, m.group(3))
    return best


def blobs(fn):
    vma = int(fn.replace("sub_", ""), 16)
    size = assemble_target(fn)
    rom = (ROOT / "fireemblem8.gba").read_bytes()
    tb = rom[vma - ROM_BASE:vma - ROM_BASE + size]
    tpath = BUILD / f"{fn}.target.bin"
    tpath.write_bytes(tb)

    obj = ROOT / "src" / "nonmatching" / f"{fn}.o"
    allbin = BUILD / f"{fn}.cand.all.bin"
    run(["arm-none-eabi-objcopy", "-O", "binary", "--only-section=.text", str(obj), str(allbin)])
    text = allbin.read_bytes()
    off, sz, sym = pick_symbol(obj, size) or (0, len(text), "text")
    cpath = BUILD / f"{fn}.cand.bin"
    cpath.write_bytes(text[off:off+sz])
    return Program(fn+"_target", tpath, vma, vma+1), Program(fn+"_candidate", cpath, vma, vma+1), size, sz, sym


def run_one(fn):
    left, right, tsz, csz, sym = blobs(fn)
    res = check_equiv(left, right, max_steps=120, max_states=96)
    print(f"{fn}: target_size={tsz} cand_symbol={sym} cand_size={csz} verdict={res.verdict} finals={res.finals_left}/{res.finals_right} reason={res.reason}")


def main(argv=None):
    argv = argv or []
    if argv and argv[0] == "--worker":
        run_one(argv[1])
        return
    fns = argv or ["sub_8001570", "sub_80A3300", "sub_80A6E4C", "sub_80C05C8"]
    for fn in fns:
        try:
            r = subprocess.run([sys.executable, __file__, "--worker", fn], cwd=ROOT, text=True, capture_output=True, timeout=30)
            out = (r.stdout + r.stderr).strip()
            if r.returncode == 0:
                print(out)
            else:
                print(f"{fn}: ERROR/FAILED rc={r.returncode} {out}")
        except subprocess.TimeoutExpired:
            print(f"{fn}: TIMEOUT after 30s (angr did not reach a proof/UNKNOWN cheaply)")


if __name__ == "__main__":
    main(sys.argv[1:])
