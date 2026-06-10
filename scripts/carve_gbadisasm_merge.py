#!/usr/bin/env python3
"""Carve a CONTIGUOUS RUN of gbadisasm functions as ONE descriptive-ASM object.

The mechanical per-function carver (scripts/carve_gbadisasm_asm.py) fails when IDA
mis-split a single JP function into several "sub_*" pieces that branch into each
other (`b _08xxxxxx` to a label defined in a sibling piece) or share an interior
jump table. Carving the whole contiguous run as ONE `.text.<name>` section makes
every interior label local to the section, so the cross-piece branches and the
jump-table `.4byte _08xxxxxx` entries resolve at link time (R_ARM_ABS32 to the
section's own labels, placed at the real JP VMA).

Same de-symbolization as the per-function carver (D24):
  * bl/b SYM to an EXTERNAL function -> `.set SYM, JP_ADDR(+1 thumb)` prelude.
  * .4byte SYM to an EXTERNAL function -> raw `.4byte 0xADDR` (addr|1 thumb).
  * .4byte _08xxxxxx to a LOCAL label (defined in the merged body) -> left as-is.

Usage:
  scripts/carve_gbadisasm_merge.py OBJNAME START_ADDR END_ADDR [NAME1 NAME2 ...]
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

import importlib.util
_spec = importlib.util.spec_from_file_location(
    "cga", os.path.join(ROOT, "scripts", "carve_gbadisasm_asm.py"))
cga = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(cga)


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)



def load_func_lines_by_addr(cache=None):
    """addr -> body lines (header line included as [0]), keyed by ADDRESS so
    duplicate function NAMES (e.g. two _fpadd_parts) don't collide."""
    cache = cache or cga.DISASM_CACHE
    cga.ensure_disasm()
    by_addr, cur_addr, lines, pending = {}, None, [], False
    fs = re.compile(r"^\s*(?:arm|thumb)_func_start (\S+)\s*$")
    ad = re.compile(r"^\S+:\s*@\s*0x([0-9A-Fa-f]+)")
    for ln in open(cache):
        if fs.match(ln):
            if cur_addr is not None:
                by_addr[cur_addr] = lines
            cur_addr, lines, pending = None, [], True
            continue
        if pending:
            m = ad.match(ln)
            if m:
                cur_addr = int(m.group(1), 16)
                pending = False
                lines = [ln.rstrip("\n")]
                continue
        if cur_addr is not None:
            lines.append(ln.rstrip("\n"))
    if cur_addr is not None:
        by_addr[cur_addr] = lines
    return by_addr


def main():
    if len(sys.argv) < 4:
        sys.exit(__doc__)
    objname = sys.argv[1]
    start = int(sys.argv[2], 16)
    end = int(sys.argv[3], 16)
    names = sys.argv[4:]

    funcs = cga.parse_cfg()
    smap = cga.sym_addr_map()
    by_addr = load_func_lines_by_addr()

    run = [(a, m, n) for (a, m, n) in funcs if start <= a < end]
    run.sort()
    if names:
        order = {n: i for i, n in enumerate(names)}
        run = [(a, m, n) for (a, m, n) in run if n in order]
        run.sort(key=lambda t: order[t[2]])
    if not run:
        sys.exit(f"no cfg funcs in [{start:08X},{end:08X})")
    print("merging run: " + ", ".join(f"{n}@{a:08X}" for a, m, n in run))

    is_thumb = run[0][1] == "thumb_func"

    merged, local = [], set()
    for idx, (a, m, n) in enumerate(run):
        body = list(by_addr[a])
        while body and not body[0].strip():
            body.pop(0)
        if body and re.match(rf"^{re.escape(n)}:\s*@", body[0]):
            body = body[1:]
        for ln in body:
            mm = re.match(r'^(_[0-9A-Fa-f]{8}):', ln)
            if mm:
                local.add(mm.group(1))
        pieces_lbl = f"_{a:08X}"
        if idx > 0:
            merged.append(f"{pieces_lbl}:")
            local.add(pieces_lbl)
        merged.extend(body)

    _BR, _BYTE_SYM, _LOCAL = cga._BR, cga._BYTE_SYM, cga._LOCAL
    branch_refs, unresolved, new_body = {}, 0, []
    for ln in merged:
        mb = _BR.match(ln)
        m4 = _BYTE_SYM.match(ln)
        if mb:
            sym = mb.group(1)
            if not (sym == objname or sym in local or _LOCAL.match(sym)):
                ra = cga._ref_addr(sym, smap)
                if ra is None:
                    unresolved += 1
                else:
                    branch_refs[sym] = ra
            new_body.append(ln)
        elif m4:
            prefix, sym = m4.group(1), m4.group(2)
            if sym == objname or sym in local or _LOCAL.match(sym):
                new_body.append(ln)
            else:
                ra = cga._ref_addr(sym, smap)
                if ra is None:
                    unresolved += 1
                    new_body.append(ln)
                else:
                    a2, thumb = ra
                    val = a2 | 1 if thumb else a2
                    new_body.append(
                        f'{prefix.rstrip()} .4byte 0x{val:08X}  @ {sym}'
                        if prefix.strip() else
                        f'{prefix}.4byte 0x{val:08X}  @ {sym}')
        else:
            new_body.append(ln)

    # Any `_08xxxxxx` label referenced (branch/.4byte) but NOT defined in the
    # merged body is an EXTERNAL absolute address living in another (already-
    # carved) function -- e.g. a `bl`/`b` to a mid-function entry point. The label
    # name encodes its address, so de-symbolize it with `.set _08xxxxxx, 0xADDR`.
    # For Thumb the assembler masks the thumb bit on branch operands, so the even
    # byte address is correct (matches gbadisasm's own US carves).
    defined = set(local)
    for ln in new_body:
        m = re.match(r'^(_[0-9A-Fa-f]{8}):', ln)
        if m:
            defined.add(m.group(1))
    ext_local = {}
    for ln in new_body:
        for sym in re.findall(r'_([0-9A-Fa-f]{8})\b', ln):
            lbl = "_" + sym
            if lbl in defined or ln.lstrip().startswith(lbl + ':'):
                continue
            ext_local[lbl] = int(sym, 16)
    if ext_local:
        print(f"  resolving {len(ext_local)} external local-address ref(s): "
              f"{sorted(ext_local)[:8]}")

    L = ['\t.syntax unified']
    for sym, (a2, thumb) in sorted(branch_refs.items()):
        L.append(f'\t.set {sym}, 0x{a2:08X}{" + 1" if thumb else ""}')
    for sym, a2 in sorted(ext_local.items()):
        L.append(f'\t.set {sym}, 0x{a2:08X}')
    L += [f'\t.section .text.{objname}, "ax", %progbits',
          f'@ {objname} @ JP 0x{start:08X}-0x{end:08X} - region-different, '
          f'gbadisasm descriptive asm (merged run, D24)',
          '\t.thumb' if is_thumb else '\t.arm',
          f'\t.global {objname}',
          '\t.thumb_func' if is_thumb else '\t.align 2, 0',
          f'{objname}:']
    L.extend(new_body)
    path = f"asm/{objname}.s"
    open(path, "w").write("\n".join(L) + "\n")
    print(f"  wrote {path} ({unresolved} unresolved ext-ref)")

    ok, err = cga.assemble_check(path)
    if not ok:
        print(f"  ASSEMBLE FAIL: {err.strip()[:600]}")
        os.remove(path)
        return 1

    frag = f"gbadisasm_{objname}"
    romlo, romhi = start - 0x08000000, end - 0x08000000
    fr_rom = f"layout/carved_rom.d/{frag}.tsv"
    fr_drop = f"layout/baseline_syms_drop.d/{frag}.tsv"
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    open(fr_rom, "w").write(
        f"{romlo:06X}\t{romhi:06X}\tasm/{objname}.o(.text.{objname})\t"
        f"{objname} region-different gbadisasm descriptive asm (merged)\n")
    bn = cga.baseline_names()
    drops = [n for (a, m, n) in run if n in bn]
    if objname in bn and objname not in drops:
        drops.append(objname)
    if drops:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        open(fr_drop, "w").write("\n".join(drops) + "\n")

    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        print(f"  {objname}: make compare OK ({end - start} bytes)")
        return 0
    for p in (path, fr_rom, fr_drop):
        if os.path.exists(p):
            os.remove(p)
    sh(f'rm -f asm/{objname}.o')
    sh("make layout")
    print(f"  {objname}: make compare FAIL -> reverted")
    print("\n".join((mc.stdout + mc.stderr).splitlines()[-15:]))
    return 1


if __name__ == "__main__":
    sys.exit(main())
