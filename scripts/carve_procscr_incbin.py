#!/usr/bin/env python3
"""Decode carved-ROM ProcCmd incbins into typed C tables.

This is the batch counterpart to depoint_procscr.py for #148: it reads a proc
script's byte range from the layout manifests, decodes entries from the built
fireemblem8.gba, resolves pointer operands against fireemblem8.elf, and prints a
ready-to-commit C translation unit.
"""
import argparse
import bisect
import glob
import os
import re
import struct
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM = 0x08000000

OPCODES = {
    0x00: ("PROC_END", None),
    0x01: ("PROC_NAME", "data"),
    0x02: ("PROC_CALL", "func"),
    0x03: ("PROC_REPEAT", "func"),
    0x04: ("PROC_SET_END_CB", "func"),
    0x05: ("PROC_START_CHILD", "data"),
    0x06: ("PROC_START_CHILD_BLOCKING", "data"),
    0x07: ("PROC_START_MAIN_BUGGED", "data"),
    0x08: ("PROC_WHILE_EXISTS", "data"),
    0x09: ("PROC_END_EACH", "data"),
    0x0A: ("PROC_BREAK_EACH", "data"),
    0x0B: ("PROC_LABEL", "imm"),
    0x0C: ("PROC_GOTO", "imm"),
    0x0D: ("PROC_JUMP", "data"),
    0x0E: ("PROC_SLEEP", "imm"),
    0x0F: ("PROC_MARK", "imm"),
    0x10: ("PROC_BLOCK", None),
    0x11: ("PROC_END_IF_DUPLICATE", None),
    0x12: ("PROC_SET_BIT4", None),
    0x13: ("PROC_13", None),
    0x14: ("PROC_WHILE", "func"),
    0x15: ("PROC_15", None),
    0x16: ("PROC_CALL_2", "func"),
    0x17: ("PROC_END_DUPLICATES", None),
    0x18: ("PROC_CALL_ARG", "func_arg"),
    0x19: ("PROC_19", None),
}

CAST_TOKENS = set("void u8 u16 u32 s8 s16 s32 const char ProcFunc ProcPtr int short long unsigned signed".split())


def read_tsv_rows(paths):
    for path in paths:
        try:
            with open(path, errors="replace") as f:
                for line in f:
                    line = line.rstrip("\n")
                    if not line or line.startswith("#"):
                        continue
                    yield path, line.split("\t")
        except OSError:
            pass


def layout_rows():
    paths = ["layout/carved_rom.tsv"] + sorted(glob.glob("layout/carved_rom.d/*.tsv"))
    rows = []
    for path, p in read_tsv_rows(paths):
        if len(p) < 3:
            continue
        try:
            start = int(p[0], 16)
            end = int(p[1], 16)
        except ValueError:
            continue
        rows.append((start, end, p[2], p[3] if len(p) > 3 else "", path))
    rows.sort()
    return rows


def baseline_addrs():
    out = {}
    paths = ["layout/baseline_syms.tsv"] + sorted(glob.glob("layout/baseline_syms.d/*.tsv"))
    for path, p in read_tsv_rows(paths):
        if len(p) < 2:
            continue
        try:
            out[p[0]] = int(p[1], 16)
        except ValueError:
            pass
    return out


def find_range(name, rows, bases):
    hits = [r for r in rows if name in (r[2] + "\t" + r[3])]
    if hits:
        return hits[0]
    addr = bases.get(name)
    if addr is None:
        raise SystemExit("%s: no carved_rom row and no baseline symbol" % name)
    off = addr - ROM if addr >= ROM else addr
    for r in rows:
        if r[0] <= off < r[1]:
            return (off, r[1], r[2], r[3], r[4])
    raise SystemExit("%s: 0x%08X is not inside any carved_rom row" % (name, addr))


def readelf_symbols(elf):
    txt = subprocess.check_output(["arm-none-eabi-readelf", "-sW", elf], text=True)
    syms = []
    for line in txt.splitlines():
        p = line.split()
        if len(p) < 8 or not p[0].endswith(":"):
            continue
        try:
            val = int(p[1], 16)
            size = int(p[2], 10)
        except ValueError:
            continue
        typ = p[3]
        name = p[7]
        if val < ROM or typ in ("FILE", "SECTION") or name.startswith("."):
            continue
        syms.append((val, size, typ, name))
    syms.sort(key=lambda x: (x[0], -(x[1] or 0), x[3]))
    return syms


def best_exact(syms, addr, want_type=None):
    cands = [s for s in syms if s[0] == addr and (want_type is None or s[2] == want_type)]
    if not cands:
        return None
    # Prefer globals/descriptive names over compiler markers if tied.
    cands.sort(key=lambda s: (s[3].startswith("$"), s[3].startswith("."), len(s[3])))
    return cands[0]


def containing(syms, addr):
    best = None
    for s in syms:
        start, size = s[0], s[1]
        if size and start <= addr < start + size:
            if best is None or start >= best[0]:
                best = s
    return best


def resolve_ptr(val, kind, syms):
    if val == 0:
        return "0", ""
    if val < ROM:
        return "(const void*)0x%08X" % val, "non-rom"
    if kind in ("func", "func_arg"):
        target = val if val & 1 else (val & ~1)
        exact = best_exact(syms, target, "FUNC") or best_exact(syms, target)
        if exact and exact[2] == "FUNC":
            return exact[3], ""
        target &= ~1
        exact = best_exact(syms, target, "FUNC") or best_exact(syms, target)
        if exact and exact[2] == "FUNC":
            return exact[3], ""
        cont = containing(syms, target)
        if cont:
            return "((u8*)%s + 0x%X)/*THUMB?*/" % (cont[3], target - cont[0]), "INTERIOR-func"
        return "(ProcFunc)0x%08X" % val, "UNRESOLVED-func"
    exact = best_exact(syms, val, "OBJECT") or best_exact(syms, val)
    if exact:
        return exact[3], ""
    cont = containing(syms, val)
    if cont:
        return "((u8*)%s + 0x%X)" % (cont[3], val - cont[0]), ""
    return "(const void*)0x%08X" % val, "UNRESOLVED-data"


def ident(expr):
    for m in re.finditer(r"[A-Za-z_]\w*", expr):
        if m.group(0) not in CAST_TOKENS:
            return m.group(0)
    return None


def header_declared_idents(include_dir="include", seeds=("global.h", "proc.h")):
    inc_re = re.compile(r'#\s*include\s+"([^"]+)"')
    cmt_re = re.compile(r"/\*.*?\*/|//[^\n]*", re.DOTALL)
    fn_re = re.compile(r"\b([A-Za-z_]\w*)\s*\(")
    ext_re = re.compile(r"\bextern\b[^;{]*?\b([A-Za-z_]\w*)\s*(?:\[[^\]]*\])*\s*;")
    seen = set()
    stack = [(s, include_dir) for s in seeds]
    out = set()
    while stack:
        rel, base = stack.pop()
        path = next((p for p in (os.path.join(base, rel), os.path.join(include_dir, rel)) if os.path.isfile(p)), None)
        if path is None or path in seen:
            continue
        seen.add(path)
        txt = open(path, errors="replace").read()
        for m in inc_re.finditer(txt):
            stack.append((m.group(1), os.path.dirname(path)))
        txt = cmt_re.sub(" ", txt)
        out.update(m.group(1) for m in fn_re.finditer(txt))
        out.update(m.group(1) for m in ext_re.finditer(txt))
    return out


def decode(name, start, end, rom_bytes, syms):
    body = []
    refs = {}
    blockers = []
    pos = start
    while pos + 8 <= end:
        w0, ptr = struct.unpack_from("<II", rom_bytes, pos)
        opcode = w0 & 0xFFFF
        imm = (w0 >> 16) & 0xFFFF
        if opcode not in OPCODES:
            blockers.append("0x%08X: unknown opcode 0x%04X" % (ROM + pos, opcode))
            break
        macro, kind = OPCODES[opcode]
        expr = "0"
        note = ""
        if kind in ("func", "func_arg", "data"):
            expr, note = resolve_ptr(ptr, kind, syms)
            base = ident(expr)
            if base and base != name:
                refs[base] = "func" if kind in ("func", "func_arg") else "data"
            if "UNRESOLVED" in note or "INTERIOR" in note:
                blockers.append("0x%08X: %s -> %s" % (ROM + pos + 4, note, expr))
        if kind is None:
            line = macro if ptr == 0 else "{ 0x%02X, 0x%04X, %s }" % (opcode, imm, expr)
        elif kind == "imm":
            line = "%s(0x%X)" % (macro, imm)
        elif kind == "func_arg":
            line = "%s(%s, 0x%X)" % (macro, expr, imm)
        else:
            line = "%s(%s)" % (macro, expr)
        body.append(line)
        pos += 8
        if opcode == 0:
            break
    return body, refs, blockers, pos


def emit_c(name, section, body, refs):
    hdr = header_declared_idents()
    print('#include "global.h"')
    print('#include "proc.h"')
    print()
    for sym in sorted(refs):
        if sym in hdr:
            continue
        if refs[sym] == "func":
            print("extern void %s();" % sym)
        elif "ProcScr" in sym or "ProcCmd" in sym:
            print("extern struct ProcCmd %s[];" % sym)
        else:
            print("extern u8 %s[];" % sym)
    if refs:
        print()
    print('struct ProcCmd %s[] __attribute__((section("%s"))) = {' % (name, section))
    for line in body:
        print("    %s," % line)
    print("};")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name")
    ap.add_argument("--rom", default="fireemblem8.gba")
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--emit-c", action="store_true")
    args = ap.parse_args()

    os.chdir(ROOT)
    rows = layout_rows()
    bases = baseline_addrs()
    start, end, objsec, desc, path = find_range(args.name, rows, bases)
    section = ".rodata.%s" % os.path.splitext(os.path.basename(objsec.split("(")[1].rstrip(")")))[0] if "(" in objsec else ".rodata.dat_%s_ref" % args.name
    m = re.search(r"\(([^)]+)\)", objsec)
    if m:
        section = m.group(1)
    with open(args.rom, "rb") as f:
        rom = f.read()
    syms = readelf_symbols(args.elf)
    body, refs, blockers, got_end = decode(args.name, start, end, rom, syms)
    print("/* %s: %s [0x%06X,0x%06X), decoded %d cmds to 0x%06X */" %
          (args.name, path, start, end, len(body), got_end))
    if blockers:
        print("/* BLOCKERS:")
        for b in blockers:
            print(" * %s" % b)
        print(" */")
    if args.emit_c:
        emit_c(args.name, section, body, refs)
    return 1 if blockers else 0


if __name__ == "__main__":
    sys.exit(main())
