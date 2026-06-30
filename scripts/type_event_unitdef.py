#!/usr/bin/env python3
"""type_event_unitdef.py -- convert a de-pointered UnitDef_Event_*_ref.c (a flat u32
word stream: either an `__asm__(".4byte ...")` block or a `static const u32 NAME__shift[]`
array, 5 words = one 20-byte struct UnitDefinition) into a typed
`struct UnitDefinition[]` C initializer (axis #6 editability, fe8u events_udefs.c style).

Word layout per entry (little-endian):
  w0 = bytes 0..3   (charIndex, classIndex, leaderCharIndex, b3=autolevel/allegiance/level)
  w1 = bytes 4..7   (pos word lo/hi, extraData, redaCount)
  w2 = redas pointer  (NULL=0, &REDA_sym, or data_sym + addend)  -> kept as symbol ref
  w3 = bytes 12..15 (items[4])
  w4 = bytes 16..19 (ai[4])

The redas symbol EXPRESSION is taken verbatim from the source word so the emitted
relocation is byte-identical (gated by `make compare`). Trailing all-zero entries are
emitted as `{0},` sentinels.

Usage: type_event_unitdef.py <path-to-_ref.c>   # prints the new file body to stdout
"""
import re, sys, os

BASE = 0x08000000

def load_map(path="fireemblem8.map"):
    s2a = {}
    if not os.path.exists(path):
        return s2a
    for line in open(path):
        m = re.match(r"\s+0x([0-9a-fA-F]+)\s+(\S+)\s*$", line)
        if m:
            s2a[m.group(2)] = int(m.group(1), 16)
    return s2a

SYM2ADDR = load_map()

def resolve_literal(expr):
    """Resolve a `SYM` / `SYM + 0xNN` expression to its literal address value using the
    linker map. Used for NON-redas field words that the de-pointerer wrongly relocated
    (e.g. a byte3==0x08 read as a SpriteText_DrawBackground+1 code pointer)."""
    m = re.fullmatch(r'(\w+)\s*\+\s*(0x[0-9A-Fa-f]+|\d+)', expr.strip())
    if m and m.group(1) in SYM2ADDR:
        return SYM2ADDR[m.group(1)] + int(m.group(2), 0)
    m = re.fullmatch(r'(\w+)', expr.strip())
    if m and m.group(1) in SYM2ADDR:
        return SYM2ADDR[m.group(1)]
    return None

def parse_words(src):
    """Return (symbol_name, section, [word_expr...]) where each word_expr is either an
    int (literal) or a string (a symbol expression like '(u32)&REDA_x' or 'data_y + 0x8')."""
    # symbol + section. two source shapes:
    #   u32 __shift[]:  SECTION(".rodata.dat_...")
    #   __asm__ block:  "\t.section .rodata.dat_..., \"a\", %progbits\n"
    msec = re.search(r'SECTION\("([^"]+)"\)', src)
    if msec:
        section = msec.group(1)
    else:
        msec = re.search(r'\.section\s+([.\w]+)', src)
        section = msec.group(1) if msec else None
    # global symbol name
    mg = re.search(r'\.global\s+(\w+)', src)
    if mg:
        name = mg.group(1)
    else:
        mg = re.search(r'\.set\s+(\w+),', src)
        name = mg.group(1) if mg else None
    words = []
    if '__asm__(' in src and '.4byte' in src:
        # asm form: lines like  "\t.4byte 0x........\n" or "\t.4byte SYM + 0xNN\n"
        for m in re.finditer(r'\.4byte\s+([^\\\n"]+?)\s*\\n', src):
            words.append(m.group(1).strip())
    else:
        # u32 __shift[] form: entries inside { ... }
        body = src[src.index('{')+1: src.rindex('}')]
        for tok in body.split(','):
            t = tok.strip()
            if not t:
                continue
            words.append(t)
    return name, section, words

def word_to_int(w):
    """If word is a pure integer literal return it, else None."""
    w = w.strip()
    m = re.fullmatch(r'0x[0-9A-Fa-f]+|\d+', w)
    if m:
        return int(w, 0)
    return None

def redas_expr(w):
    """Normalise a redas word expression into a `.redas` initializer value (or None for NULL)."""
    iv = word_to_int(w)
    if iv == 0:
        return None
    if iv is not None:
        # a non-zero integer redas pointer with no symbol -- keep as raw cast (rare)
        return f"(const struct REDA *)0x{iv:08X}"
    # symbol expression. forms:  (u32)&SYM   |   SYM   |   SYM + 0xNN
    w = w.strip()
    m = re.fullmatch(r'\(u32\)&(\w+)', w)
    if m:
        return m.group(1)
    m = re.fullmatch(r'(\w+)\s*\+\s*(0x[0-9A-Fa-f]+|\d+)', w)
    if m:
        return f"(const struct REDA *)((const u8 *){m.group(1)} + {m.group(2)})"
    m = re.fullmatch(r'\(u32\)&(\w+)\s*\+\s*(0x[0-9A-Fa-f]+|\d+)', w)
    if m:
        return f"(const struct REDA *)((const u8 *){m.group(1)} + {m.group(2)})"
    if re.fullmatch(r'\w+', w):
        return w
    raise SystemExit(f"unhandled redas expr: {w!r}")

def field_word(w):
    """A non-redas field word: a pure literal, or a SYM+N expression the de-pointerer
    wrongly relocated -> resolve to its literal address value via the map."""
    v = word_to_int(w)
    if v is not None:
        return v
    return resolve_literal(w)

def fmt_entry(w0, w1, redas_w, w3, w4):
    v0 = field_word(w0); v1 = field_word(w1)
    v3 = field_word(w3); v4 = field_word(w4)
    if None in (v0, v1, v3, v4):
        raise SystemExit(f"non-literal field word in entry: {w0,w1,w3,w4}")
    b = list(v0.to_bytes(4, "little")) + list(v1.to_bytes(4, "little")) + [0,0,0,0] + \
        list(v3.to_bytes(4, "little")) + list(v4.to_bytes(4, "little"))
    f = []
    def add(k, v): f.append(f".{k}={v}")
    b3 = b[3]; w45 = b[4] | (b[5] << 8)
    if b[0]:               add("charIndex", f"0x{b[0]:X}")
    if b[1]:               add("classIndex", f"0x{b[1]:X}")
    if b[2]:               add("leaderCharIndex", f"0x{b[2]:X}")
    if b3 & 1:             add("autolevel", f"0x{b3 & 1:X}")
    if (b3 >> 1) & 3:      add("allegiance", f"0x{(b3 >> 1) & 3:X}")
    if (b3 >> 3) & 0x1f:   add("level", f"0x{(b3 >> 3) & 0x1f:X}")
    if w45 & 0x3f:         add("xPosition", f"0x{w45 & 0x3f:X}")
    if (w45 >> 6) & 0x3f:  add("yPosition", f"0x{(w45 >> 6) & 0x3f:X}")
    if (w45 >> 12) & 1:    add("genMonster", f"0x{(w45 >> 12) & 1:X}")
    if (w45 >> 13) & 1:    add("itemDrop", f"0x{(w45 >> 13) & 1:X}")
    if (w45 >> 14) & 1:    add("sumFlag", f"0x{(w45 >> 14) & 1:X}")
    if (w45 >> 15) & 1:    add("unk_05_7", f"0x{(w45 >> 15) & 1:X}")
    if b[6]:               add("extraData", f"0x{b[6]:X}")
    if b[7]:               add("redaCount", f"0x{b[7]:X}")
    rv = redas_expr(redas_w)
    if rv:                 add("redas", rv)
    items = b[12:16]
    nz = [k for k, v in enumerate(items) if v]
    if nz:
        add("items", "{" + ", ".join(f"0x{items[k]:X}" for k in range(max(nz)+1)) + "}")
    ai = b[16:20]
    nz = [k for k, v in enumerate(ai) if v]
    if nz:
        add("ai", "{" + ", ".join(f"0x{ai[k]:X}" for k in range(max(nz)+1)) + "}")
    if not f:
        return "    {0},"
    return "    { " + ", ".join(f) + " },"

def main():
    path = sys.argv[1]
    src = open(path).read()
    if "struct UnitDefinition" in src:
        raise SystemExit(f"{path}: already typed, skipping")
    name, section, words = parse_words(src)
    assert len(words) % 5 == 0, f"{name}: {len(words)} words not a multiple of 5"
    # collect referenced symbols for extern decls, split by how they are referenced:
    #   bare `SYM` / `(u32)&SYM`           -> the redas IS the array  -> struct REDA SYM[]
    #   `SYM + 0xNN` (base+offset cast)    -> SYM is a raw data blob   -> const u8 SYM[]
    reda_refs, blob_refs = set(), set()
    for i, w in enumerate(words):
        if i % 5 != 2 or word_to_int(w) is not None:
            continue
        # extract the referenced symbol, ignoring a leading (u32)& or & cast
        ws = re.sub(r'^\(u32\)\s*', '', w.strip())
        ws = re.sub(r'^&', '', ws)
        m = re.match(r'([A-Za-z_]\w*)', ws)
        if not m:
            continue
        sym = m.group(1)
        if re.search(r'\+\s*(0x[0-9A-Fa-f]+|\d+)', w):
            blob_refs.add(sym)
        else:
            reda_refs.add(sym)
    reda_refs = sorted(reda_refs)
    blob_refs = sorted(blob_refs)
    out = []
    out.append('#include "global.h"')
    out.append('#include "bmunit.h"')
    out.append('#include "muctrl.h"')
    out.append("")
    out.append(f"/* Typed from the de-pointered {name} word stream (axis #6 editability,")
    out.append(" * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is")
    out.append(" * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a")
    out.append(" * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to")
    out.append(" * baserom (gated by `make compare`). */")
    out.append("")
    for r in reda_refs:
        out.append(f"extern struct REDA {r}[];")
    for r in blob_refs:
        out.append(f"extern const u8 {r}[];")
    if reda_refs or blob_refs:
        out.append("")
    out.append(f'SECTION("{section}") struct UnitDefinition {name}[] =')
    out.append("{")
    for i in range(0, len(words), 5):
        out.append(fmt_entry(words[i], words[i+1], words[i+2], words[i+3], words[i+4]))
    out.append("};")
    print("\n".join(out))

if __name__ == "__main__":
    main()
