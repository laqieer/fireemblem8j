#!/usr/bin/env python3
"""Carve REGION-DIFFERENT code as mechanical descriptive ASM via gbadisasm (D23).

The exact/masked/unported/stranded carvers only handle REGION-SAME code (uniquely
located against the US decomp). The remaining ~6000 functions are REGION-DIFFERENT
(IDA found them in the JP ROM but they don't match a US TU). Hand-decompiling them
to C is slow; this carver instead emits BUILD-READY DESCRIPTIVE ASM for them — real
ARM/Thumb instructions disassembled by `tools/gbadisasm` from the JP ROM — which
assembles BYTE-IDENTICAL and links at the correct JP address. This is the
descriptive-asm-first bootstrap (exactly how fireemblem8u was built): it pushes the
code front toward byte-complete mechanically; decompiling each to C is a later,
incremental step.

Pipeline per function:
  1. Slice the function's lines out of the cached full-ROM gbadisasm output
     (tools/gbadisasm/fe8j_full.cfg -> the whole ROM, run once and cached).
  2. Emit `asm/<name>.s`: a `.text.<name>` section with the MANDATORY
     `.syntax unified` prelude, `.thumb`/`.arm`, a `.global`/`.thumb_func` label,
     and the function body verbatim. Literal pools stay raw `.4byte 0xADDR` —
     absolute constants are byte-identical by construction at the JP address.
  3. PRE-GATE: assemble standalone with `-mcpu=arm7tdmi -mthumb-interwork` and
     byte-compare the `.text` against baserom.gba at the JP offset. (Missing the
     `.syntax unified` prelude or those assembler flags silently corrupts bytes —
     this pre-gate catches it before touching the layout.)
  4. Write the per-task layout fragments (carved_rom.d + baseline_syms_drop.d),
     `make layout`, then `make compare`. OK -> keep + commit; FAIL -> revert.

Parallel-safe: one fragment + one flat `asm/<name>.s` per function (Makefile asm
glob is non-recursive, so asm files MUST be flat in asm/). Each carve is its own
verify-or-revert; the manifest rows go ONLY to per-task fragments. Like
carve_unported_asm.py this ADDS BYTE COVERAGE and names the function but does NOT
count as a "decompiled C function" in calcprogress.py — the intended trade.

gbadisasm is a CARVE-TIME tool: the committed `.s` is what the build consumes; the
build/CI never need gbadisasm. Binary + fe8j_full.cfg are gitignored.

Usage:
  scripts/carve_gbadisasm_asm.py --list [N]      # show N uncarved candidates
  scripts/carve_gbadisasm_asm.py ADDR [ADDR..]   # carve these JP addrs (hex)
  scripts/carve_gbadisasm_asm.py --pilot         # carve the 20-fn pilot set
  scripts/carve_gbadisasm_asm.py --batch N        # carve the next N uncarved fns
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)  # the worktree this script lives in
CODE_END = 0x080DC134  # first data byte; code is jp < this

# gbadisasm is a carve-time tool; it may live in this worktree's tools/ or be
# shared from the main repo. The full-ROM disasm is cached in /tmp.
GBADISASM = os.environ.get("GBADISASM") or next(
    (p for p in ("tools/gbadisasm/gbadisasm",
                 os.path.join(ROOT, "..", "..", "..", "tools", "gbadisasm", "gbadisasm"))
     if os.path.exists(p)), "tools/gbadisasm/gbadisasm")
CFG = os.environ.get("GBADISASM_CFG", "tools/gbadisasm/fe8j_full.cfg")
DISASM_CACHE = os.environ.get("GBADISASM_CACHE", "/tmp/fe8j_full_disasm.s")

# The proven pilot anchors (D23): byte-identical round-tripped, end-to-end carved.
PILOT_ANCHORS = [0x08001448, 0x08000CF0, 0x080510D4]


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


# ---------------------------------------------------------------------------
# config + cached disasm

def parse_cfg():
    """Return sorted [(addr, mode, name)] from the gbadisasm config."""
    funcs = []
    if not os.path.exists(CFG):
        sys.exit(f"ERROR: {CFG} missing - run scripts/ida/export_gbadisasm_cfg.py")
    for ln in open(CFG):
        ln = ln.strip()
        if not ln or ln.startswith("#"):
            continue
        p = ln.split()
        if len(p) >= 3 and p[0] in ("arm_func", "thumb_func"):
            funcs.append((int(p[1], 16), p[0], p[2]))
    funcs.sort()
    return funcs


def ensure_disasm():
    """Run gbadisasm on the full config once; cache the whole-ROM output."""
    if os.path.exists(DISASM_CACHE) and os.path.getsize(DISASM_CACHE) > 0:
        return
    if not os.path.exists(GBADISASM):
        sys.exit(f"ERROR: gbadisasm binary not found at {GBADISASM} (set $GBADISASM)")
    print(f"running gbadisasm (one-time, ~25s) -> {DISASM_CACHE}", flush=True)
    r = sh(f'"{GBADISASM}" baserom.gba -c "{CFG}" > "{DISASM_CACHE}"')
    if r.returncode != 0 or os.path.getsize(DISASM_CACHE) == 0:
        sys.exit(f"ERROR: gbadisasm failed: {r.stderr[:500]}")


def load_func_lines():
    """Index the cached disasm by function: name -> list of body lines (the lines
    AFTER the `*_func_start NAME` marker, up to the next `*_func_start`)."""
    ensure_disasm()
    by_name, cur, lines = {}, None, []
    fs = re.compile(r"^\s*(?:arm|thumb)_func_start (\S+)\s*$")
    for ln in open(DISASM_CACHE):
        m = fs.match(ln)
        if m:
            if cur is not None:
                by_name[cur] = lines
            cur, lines = m.group(1), []
            continue
        if cur is not None:
            lines.append(ln.rstrip("\n"))
    if cur is not None:
        by_name[cur] = lines
    return by_name


# ---------------------------------------------------------------------------
# carved-set bookkeeping (fragment-aware)

def carved_rom_ranges():
    ranges = []
    for path in ["layout/carved_rom.tsv"] + sorted(glob.glob("layout/carved_rom.d/*.tsv")):
        if not os.path.exists(path):
            continue
        for ln in open(path):
            ln = ln.rstrip("\n")
            if not ln or ln.lstrip().startswith("#"):
                continue
            c = ln.split("\t")
            if len(c) < 3:
                continue
            try:
                s, e = int(c[0], 16), int(c[1], 16)
            except ValueError:
                continue
            ranges.append((0x08000000 + s, 0x08000000 + e))
    ranges.sort()
    return ranges


def baseline_names():
    names = set()
    for p in ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv")):
        if not os.path.exists(p):
            continue
        for l in open(p):
            if l.strip() and not l.startswith("#"):
                names.add(l.split("\t")[0])
    return names


def candidates():
    """Sorted [(addr, mode, name, gap)] of UNCARVED code functions.

    gap = next func addr - this addr (the function's extent incl. any inter-func
    pad). The carve range is the ASSEMBLED size 4-aligned, not gap, so it tiles
    cleanly with the incbin baseline regardless of pad."""
    funcs = parse_cfg()
    ranges = carved_rom_ranges()

    def covered(a, sz):
        for s, e in ranges:
            if a < e and a + sz > s:
                return True
        return False

    out = []
    for i, (a, mode, name) in enumerate(funcs):
        if a >= CODE_END:
            continue
        nxt = funcs[i + 1][0] if i + 1 < len(funcs) else CODE_END
        gap = nxt - a
        if covered(a, gap):
            continue
        out.append((a, mode, name, gap))
    return out


# ---------------------------------------------------------------------------
# emit + assemble one function

def emit_asm(addr, mode, name, body_lines):
    """Write asm/<name>.s for one function. Returns the path."""
    is_thumb = (mode == "thumb_func")
    # drop the leading `NAME: @ 0xADDR` line (we provide our own label) but keep
    # everything else (instructions, local labels, literal pools, .align).
    body = list(body_lines)
    while body and not body[0].strip():
        body.pop(0)
    if body and re.match(rf"^{re.escape(name)}:\s*@", body[0]):
        body = body[1:]
    L = ['\t.syntax unified',
         f'\t.section .text.{name}, "ax", %progbits',
         f'@ {name} @ JP 0x{addr:08X} - region-different, gbadisasm descriptive asm (D23)',
         '\t.thumb' if is_thumb else '\t.arm',
         f'\t.global {name}',
         '\t.thumb_func' if is_thumb else '\t.align 2, 0',
         f'{name}:']
    L.extend(body)
    path = f"asm/{name}.s"
    open(path, "w").write("\n".join(L) + "\n")
    return path


def assemble_size(path):
    """Assemble the .s standalone with the mandatory flags; return (ok, nbytes)."""
    obj = path[:-2] + ".o"
    binf = path[:-2] + ".bin"
    sec = ".text." + os.path.basename(path)[:-2]
    r = sh(f'arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . '
           f'"{path}" -o "{obj}"')
    if r.returncode != 0:
        return False, 0, r.stderr
    sh(f'arm-none-eabi-objcopy -O binary --only-section="{sec}" "{obj}" "{binf}"')
    n = os.path.getsize(binf) if os.path.exists(binf) else 0
    return True, n, ""


def rom_bytes(off, n):
    with open("baserom.gba", "rb") as f:
        f.seek(off)
        return f.read(n)


def pre_gate(path, addr):
    """Assemble standalone and byte-compare .text vs the JP ROM. Returns
    (ok, nbytes, msg). This is the cheap per-symbol gate before the full build."""
    ok, n, err = assemble_size(path)
    if not ok:
        return False, 0, f"assemble failed: {err[:300]}"
    binf = path[:-2] + ".bin"
    got = open(binf, "rb").read()
    want = rom_bytes(addr - 0x08000000, n)
    if got != want:
        # find first diff
        d = next((i for i in range(min(len(got), len(want))) if got[i] != want[i]), -1)
        return False, n, f"byte mismatch at +0x{d:x} (asm 0x{n:x} bytes)"
    return True, n, ""


# ---------------------------------------------------------------------------
# carve one function: fragment + verify-or-revert

def carve_one(addr, mode, name, body_lines):
    if os.path.exists(f"asm/{name}.s"):
        print(f"  {name} @ {addr:08X}: asm/{name}.s exists -> skip", flush=True)
        return None
    frag = f"gbadisasm_{name}"
    files = [f"asm/{name}.s",
             f"layout/carved_rom.d/{frag}.tsv",
             f"layout/baseline_syms_drop.d/{frag}.tsv"]
    snap = {p: (open(p).read() if os.path.exists(p) else None) for p in files}

    path = emit_asm(addr, mode, name, body_lines)
    ok, n, msg = pre_gate(path, addr)
    if not ok:
        os.remove(path)
        sh(f'rm -f asm/{name}.o asm/{name}.bin')
        print(f"  {name} @ {addr:08X}: PRE-GATE FAIL ({msg}) -> reverted", flush=True)
        return False
    romlo = addr - 0x08000000
    romhi = romlo + n
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    open(f"layout/carved_rom.d/{frag}.tsv", "w").write(
        f"{romlo:06X}\t{romhi:06X}\tasm/{name}.o(.text.{name})\t"
        f"{name} region-different gbadisasm descriptive asm\n")
    # drop a redundant jp_syms alias for this name (our .global would double-define)
    if name in baseline_names():
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        open(f"layout/baseline_syms_drop.d/{frag}.tsv", "w").write(name + "\n")

    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        sh(f'rm -f asm/{name}.bin')  # keep .o (build output), drop the pre-gate bin
        print(f"  {name} @ {addr:08X}: OK ({n} bytes)", flush=True)
        return True
    # revert
    for p, c in snap.items():
        if c is None:
            if os.path.exists(p):
                os.remove(p)
        else:
            open(p, "w").write(c)
    sh(f'rm -f asm/{name}.o asm/{name}.bin')
    sh("make layout")
    print(f"  {name} @ {addr:08X}: make compare FAIL -> reverted", flush=True)
    return False


def commit(name, addr, n):
    sh("git add -A")
    sh(f'git commit -q -m "carve(asm): {name} @ {addr:08X} region-different gbadisasm '
       f'descriptive asm ({n} bytes)\n\n'
       f'Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"')


# ---------------------------------------------------------------------------
# main

def main():
    args = sys.argv[1:]
    funcs = {a: (a, m, n, g) for (a, m, n, g) in candidates()}
    by_name = None

    if not args or args[0] == "--list":
        N = int(args[1]) if len(args) > 1 else 30
        cands = sorted(funcs.values())
        print(f"uncarved region-different code funcs: {len(cands)}", flush=True)
        for a, m, n, g in cands[:N]:
            print(f"  {a:08X} {m:11s} {n:32s} gap {g:#x}")
        return 0

    # build the target address list
    if args[0] == "--pilot":
        all_funcs = {a: (a, m, n) for (a, m, n) in parse_cfg()}
        targets = list(PILOT_ANCHORS)
        for a, m, n, g in sorted(funcs.values()):
            if a not in targets and len(targets) < 20:
                targets.append(a)
        # ensure anchors that are already carved are skipped gracefully later
    elif args[0] == "--batch":
        N = int(args[1])
        targets = [a for a, m, n, g in sorted(funcs.values())][:N]
    else:
        targets = [int(a, 16) for a in args]

    by_name = load_func_lines()
    addr_meta = {a: (a, m, n) for (a, m, n) in parse_cfg()}

    ok_n = fail_n = bytes_n = 0
    for addr in targets:
        meta = addr_meta.get(addr)
        if not meta:
            print(f"  {addr:08X}: not a known function in cfg -> skip", flush=True)
            continue
        _, mode, name = meta
        body = by_name.get(name)
        if body is None:
            print(f"  {name} @ {addr:08X}: no disasm body -> skip", flush=True)
            continue
        res = carve_one(addr, mode, name, body)
        if res is True:
            # recompute size from the committed fragment for the report
            frag = f"layout/carved_rom.d/gbadisasm_{name}.tsv"
            lo, hi = [int(x, 16) for x in open(frag).read().split("\t")[:2]]
            commit(name, addr, hi - lo)
            ok_n += 1
            bytes_n += hi - lo
        elif res is False:
            fail_n += 1

    mc = sh("make compare")
    green = "fireemblem8.gba: OK" in mc.stdout
    print(f"\ncarve_gbadisasm_asm: carved {ok_n} fns / {bytes_n} bytes; "
          f"{fail_n} failed; build {'GREEN' if green else 'RED'}", flush=True)
    return 0 if green else 1


if __name__ == "__main__":
    sys.exit(main())
