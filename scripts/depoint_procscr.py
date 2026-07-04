#!/usr/bin/env python3
"""depoint_procscr.py -- #148 proc-script split+decompile helper (reusable).

Given a frontier-data .c file whose proc scripts live as inline `.4byte`/`.short`
`__asm__` blob sections (2 `.4byte` words per 8-byte `struct ProcCmd`), decode ONE
named table into a typed `struct ProcCmd NAME[]` body with symbolized pointers, and
report its exact byte extent + the .c line range to carve out.

The pointer words in a blob may already be symbolic (`.4byte Talk_OnInit`, from an
earlier shiftability pass) or still raw hex (`.4byte 0x08013919`). Symbolic operands
are reused verbatim; raw pointers are resolved against the freshly-built ELF symbol
table (arm-none-eabi-nm -S --defined-only) -- Thumb FUNC -> bare symbol (ld ORs the
Thumb bit, NO addend), data OBJECT -> (cast)((u8*)Sym + off), non-pointer immediates
stay raw hex.

Read-only: prints C + a carve plan; never edits the tree. make compare is the oracle.

Usage:
    python3 scripts/depoint_procscr.py <file.c> <NAME> <0xADDR> [--section SEC] [--nm /tmp/nm.txt]
"""
import argparse
import os
import re
import sys

_HDR_IDENTS = None


def header_declared_idents(include_dir="include", seeds=("global.h", "proc.h")):
    """Identifiers declared in the transitive `#include "..."` closure of the ref
    file's own includes (default global.h + proc.h -- the section-ref template).

    We must NOT re-`extern` a symbol that one of these headers already declares:
    an auto `extern void F();` conflicts with a real prototype `bool8 F(void);`
    and agbcc -Werror aborts. But we MUST still declare symbols that live only in
    NON-included headers (e.g. bmmind.h) or nowhere -- so we scan ONLY the closure
    that the ref .c actually pulls in, never the whole include/ tree."""
    global _HDR_IDENTS
    if _HDR_IDENTS is not None:
        return _HDR_IDENTS
    inc_re = re.compile(r'#\s*include\s+"([^"]+)"')
    seen = set()
    stack = [(s, include_dir) for s in seeds]
    while stack:
        rel, base = stack.pop()
        cand = [os.path.join(base, rel), os.path.join(include_dir, rel)]
        path = next((p for p in cand if os.path.isfile(p)), None)
        if path is None or path in seen:
            continue
        seen.add(path)
        txt = open(path, errors="replace").read()
        for m in inc_re.finditer(txt):
            stack.append((m.group(1), os.path.dirname(path)))
    idents = set()
    fn_re = re.compile(r'\b([A-Za-z_]\w*)\s*\(')
    ext_re = re.compile(r'\bextern\b[^;{]*?\b([A-Za-z_]\w*)\s*(?:\[[^\]]*\])*\s*;')
    cmt_re = re.compile(r'/\*.*?\*/|//[^\n]*', re.DOTALL)
    for path in seen:
        txt = open(path, errors="replace").read()
        # strip comments first: functions.h stubs unknown protos as commented
        # `// ??? Name(???);` lines -- those are NOT real declarations, so a match
        # inside them must not suppress the extern we owe (Wave-25 undeclared bug).
        txt = cmt_re.sub(" ", txt)
        for m in fn_re.finditer(txt):
            idents.add(m.group(1))
        for m in ext_re.finditer(txt):
            idents.add(m.group(1))
    _HDR_IDENTS = idents
    return idents

# opcode -> (macro, operand-kind). kind: None=bare, 'imm', 'func', 'script',
# 'name', 'func_arg'. Mirrors include/proc.h.
OPCODES = {
    0x00: ("PROC_END", None),
    0x01: ("PROC_NAME", "name"),
    0x02: ("PROC_CALL", "func"),
    0x03: ("PROC_REPEAT", "func"),
    0x04: ("PROC_SET_END_CB", "func"),
    0x05: ("PROC_START_CHILD", "script"),
    0x06: ("PROC_START_CHILD_BLOCKING", "script"),
    0x07: ("PROC_START_MAIN_BUGGED", "script"),
    0x08: ("PROC_WHILE_EXISTS", "script"),
    0x09: ("PROC_END_EACH", "script"),
    0x0A: ("PROC_BREAK_EACH", "script"),
    0x0B: ("PROC_LABEL", "imm"),
    0x0C: ("PROC_GOTO", "imm"),
    0x0D: ("PROC_JUMP", "func"),
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

ROM = 0x08000000


def load_nm(path):
    """[(base, size, type, name)] sorted; only sized (defined-with-size) entries."""
    syms = []
    with open(path) as f:
        for line in f:
            p = line.split()
            if len(p) < 4:
                continue
            try:
                base = int(p[0], 16)
                size = int(p[1], 16)
            except ValueError:
                continue
            syms.append((base, size, p[2], p[3]))
    syms.sort()
    return syms


def resolve(val, kind, syms):
    """Resolve a raw pointer word -> C expression string (+ note)."""
    if val == 0:
        return "0", ""
    if val < ROM:  # not a ROM pointer -> coincidental immediate, keep raw
        return "(const void*)0x%08X" % val, "non-ptr-imm"
    if kind == "func":
        target = val & ~1  # strip Thumb bit
        for base, size, typ, name in syms:
            if base == target and typ in "Tt":
                if val & 1:
                    return name, ""  # bare: ld re-ORs Thumb bit
                return name, "EVEN-func-ptr?"
        # not an exact func base -> report for manual handling
        for base, size, typ, name in syms:
            if base <= target < base + size:
                return "((u8*)%s + 0x%X)/*THUMB?*/" % (name, target - base), "INTERIOR-func"
        return "(ProcFunc)0x%08X" % val, "UNRESOLVED-func"
    # data-ish (script/name/data)
    best = None
    for base, size, typ, name in syms:
        if base <= val < base + size:
            best = (base, size, typ, name)
    if best is None:
        return "(const void*)0x%08X" % val, "UNRESOLVED-data"
    base, size, typ, name = best
    off = val - base
    if off == 0:
        return name, ""
    return "((u8*)%s + 0x%X)" % (name, off), ""


CAST_TOKENS = {"void", "u8", "u16", "u32", "s8", "s16", "s32", "const", "char",
               "ProcFunc", "ProcPtr", "int", "short", "long", "unsigned", "signed"}


def csym(text):
    """Rewrite an ASM-style symbolic operand into a C-byte-correct expression.

    ASM `Sym + 0xNN` means base+NN BYTES; but in C, `Sym + NN` on a typed array
    scales by sizeof(elem). So any `Sym +/- off` is rewritten to byte arithmetic
    `(void*)((u8*)Sym + off)`. A bare symbol decays to its address unchanged.
    """
    t = text.strip()
    m = re.match(r'^([A-Za-z_]\w*)\s*([+\-])\s*(0x[0-9A-Fa-f]+|\d+)$', t)
    if m:
        sign = "" if m.group(2) == "+" else "-"
        return "(void*)((u8*)%s %s %s)" % (m.group(1), m.group(2), m.group(3)) \
            if sign == "" else "(void*)((u8*)%s - %s)" % (m.group(1), m.group(3))
    return t


def extract_ident(text):
    """First non-cast C identifier in an operand expression (base symbol), or None."""
    for m in re.finditer(r'[A-Za-z_]\w*', text):
        if m.group(0) not in CAST_TOKENS:
            return m.group(0)
    return None


ITEM_RE = re.compile(r'"\s*(?:\\t)?\.(4byte|byte|short|incbin)\s+(.*?)\\n"')


def label_base(name):
    """Derive a blob label's ROM base address from its name (any frontier file).

    Two committed label styles:
      * `data_08XXXXXX`         -> the FULL absolute address (0x08XXXXXX).
      * `<prefix>_<seq>_<HEX>`  -> HEX is the offset-from-ROM (e.g.
        frontier_df3_data_5aa96c_000_5D367C -> ROM + 0x5D367C;
        frontier_df4_uistuff_022_5B90D8    -> ROM + 0x5B90D8).
    Returns int base or None.
    """
    m = re.fullmatch(r'data_(0[0-9A-Fa-f]{6,7})', name)
    if m:
        v = int(m.group(1), 16)
        return v if v >= ROM else ROM + v
    m = re.search(r'_([0-9A-Fa-f]{4,7})$', name)
    if m:
        try:
            return ROM + int(m.group(1), 16)
        except ValueError:
            return None
    return None


def parse_sections(path):
    """Parse __asm__ blob sections. -> list of dicts {base,name,items:[(line_idx,size,val_or_text,raw)]}."""
    lines = open(path).read().splitlines()
    sections = []
    cur = None
    for i, line in enumerate(lines):
        m = re.search(r'\.global\s+([A-Za-z_]\w*)', line)
        if m:
            base = label_base(m.group(1))
            cur = {"name": m.group(1), "base": base, "items": [], "start_line": i}
            sections.append(cur)
            continue
        if cur is None:
            continue
        im = ITEM_RE.search(line)
        if not im:
            continue
        kind, operand = im.group(1), im.group(2).strip()
        if kind == "4byte":
            size = 4
        elif kind == "short":
            size = 2
        elif kind == "byte":
            size = 1
        else:  # incbin "file", off, len  -> size = len
            parts = [x.strip() for x in operand.split(",")]
            size = int(parts[-1], 0) if len(parts) >= 3 else None
        # numeric value if pure hex/dec, else None (symbolic)
        val = None
        mo = re.fullmatch(r'0x[0-9A-Fa-f]+|\d+', operand)
        if mo:
            val = int(operand, 0)
        cur["items"].append({"line": i, "size": size, "val": val, "text": operand})
    # assign addresses
    for s in sections:
        a = s["base"]
        for it in s["items"]:
            it["addr"] = a
            if a is not None and it["size"]:
                a += it["size"]
        s["end"] = a
    return lines, sections


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("cfile")
    ap.add_argument("name")
    ap.add_argument("addr")
    ap.add_argument("--section", default=None, help="section attr suffix (default dat_<NAME>_ref)")
    ap.add_argument("--nm", default="/tmp/nm.txt")
    ap.add_argument("--limit", type=lambda x: int(x, 0), default=None,
                    help="hard stop addr (default: next named symbol / section end)")
    args = ap.parse_args()
    addr = int(args.addr, 16)
    syms = load_nm(args.nm)
    lines, sections = parse_sections(args.cfile)

    # locate enclosing section + item index of addr
    sec = None
    for s in sections:
        if s["base"] is not None and s["base"] <= addr < (s["end"] or 0):
            sec = s
            break
    if sec is None:
        sys.exit("addr 0x%X not found in any blob section of %s" % (addr, args.cfile))

    items = sec["items"]
    idx = next((k for k, it in enumerate(items) if it["addr"] == addr), None)
    if idx is None:
        sys.exit("addr 0x%X not item-aligned in section %s" % (addr, sec["name"]))

    # decode ProcCmds: each = two 4-byte items (word0=op|imm, word1=ptr)
    body = []
    refs = {}
    a = addr
    k = idx
    end = None
    label_note = ""
    while k + 1 < len(items):
        it0, it1 = items[k], items[k + 1]
        if it0["size"] != 4 or it1["size"] != 4:
            label_note = "non-4byte item at 0x%X; stop" % a
            break
        if it0["val"] is None:
            label_note = "symbolic opcode word at 0x%X; stop" % a
            break
        w0 = it0["val"]
        op = w0 & 0xFF
        imm = (w0 >> 16) & 0xFFFF
        opcode16 = w0 & 0xFFFF
        if opcode16 not in OPCODES:
            label_note = "unknown opcode 0x%04X at 0x%X; stop (leave as blob)" % (opcode16, a)
            break
        macro, kind = OPCODES[opcode16]
        # operand from word1 (symbolic text or hex)
        if it1["val"] is None:
            optext = csym(it1["text"])  # already-symbolic operand: byte-correct reuse
            note = "(sym)"
        else:
            optext, note = resolve(it1["val"], kind or "data", syms)
        # collect referenced base symbol for extern emission
        ident = extract_ident(optext)
        if ident is not None:
            is_func = kind in ("func", "func_arg")
            if refs.get(ident) != "func":  # func classification wins
                refs[ident] = "func" if is_func else "data"
        # build macro
        if kind is None:
            if it1["val"] not in (0, None):
                line = "{ 0x%02X, 0x%04X, %s }" % (op, imm, optext)
            else:
                line = macro
        elif kind == "imm":
            line = "%s(0x%X)" % (macro, imm)
        elif kind == "func_arg":
            line = "%s(%s, 0x%X)" % (macro, optext, imm)
        else:
            line = "%s(%s)" % (macro, optext)
        body.append((a, line, note if "sym" not in note else ""))
        k += 2
        a += 8
        if opcode16 == 0x00:  # PROC_END terminates the table
            end = a
            break
        if args.limit and a >= args.limit:
            end = a
            break
        # stop if next addr is another named symbol boundary handled by caller
    if end is None:
        end = a

    sec_attr = args.section or ("dat_%s_ref" % args.name)
    print("/* %s @ 0x%08X  extent [0x%08X, 0x%08X)  %d cmds  %d bytes */"
          % (args.name, addr, addr, end, len(body), end - addr))
    if label_note:
        print("/* NOTE: %s */" % label_note)
    print("struct ProcCmd %s[] __attribute__((section(\".rodata.%s\"))) = {" % (args.name, sec_attr))
    for a2, line, note in body:
        c = ("  // %s" % note) if note else ""
        print("    %s,%s" % (line, c))
    print("};")
    # carve plan: .c line range of this table's items
    first_line = items[idx]["line"]
    last_line = items[k - 1]["line"] if k - 1 < len(items) else items[-1]["line"]
    print("/* CARVE .c lines %d..%d (1-based %d..%d) in section %s (base 0x%08X) */"
          % (first_line, last_line, first_line + 1, last_line + 1, sec["name"], sec["base"]))
    # extern declarations for referenced symbols (self-ref excluded: array is in
    # scope within its own initializer). ProcScr data -> struct ProcCmd[], other
    # data -> u8[], funcs -> void(). Offsets are always (u8*)-cast, so declared
    # element type never affects byte arithmetic; type is dedupe/compile aid only.
    exts = []
    hdr = header_declared_idents()
    for name in sorted(refs):
        if name == args.name:
            continue
        if name in hdr:
            # already declared in a project header (e.g. functions.h prototype);
            # re-declaring would conflict under -Werror. Use the header's decl.
            continue
        if refs[name] == "func":
            exts.append("extern void %s();" % name)
        elif "ProcScr" in name or "ProcCmd" in name:
            exts.append("extern struct ProcCmd %s[];" % name)
        else:
            exts.append("extern u8 %s[];" % name)
    if exts:
        print("/* EXTERNS for %s:" % args.name)
        for e in exts:
            print(e)
        print("*/")


if __name__ == "__main__":
    main()
