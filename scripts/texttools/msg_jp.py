#!/usr/bin/env python3
"""msg_jp.py -- byte-exact JP (FE8 Seima no Kouseki) message text codec.

The JP ROM stores its 3339 in-game messages as CP932 (Shift-JIS) `u16` symbol
streams, Huffman-compressed into a single block:

    0x0ED7F4 .. 0x14929B   per-message bitstreams (contiguous, suffix-shared)
    0x14929B               one 0x00 pad byte (4-byte align the tree)
    0x14929C .. 0x14D08C   gMsgHuffmanTable  (3963 u32 nodes; root = node 0xF7A)
    0x14D088               gMsgHuffmanTableRoot (u32 ptr -> 0x0814D084)
    0x14D08C .. 0x1504B8   gMsgTable         (3339 u32 PR-style message pointers)

This module DUMPS the block to committed, human-readable source
(texts/jp_texts.txt + texts/jp_textdefs.txt + texts/jp_huffman_tiebreaks.txt)
and RE-ENCODES it byte-for-byte.

Encoder = the same frequency-driven Huffman builder as the US texttools
(scripts/texttools/huffman.py), which reproduces 3962 of the JP tree's 3963
nodes exactly. The 3963rd node is a single equal-frequency tie the original
encoder's linked-list resolved opposite to the simplified Python model; it is
fixed by ONE content-keyed override loaded from jp_huffman_tiebreaks.txt (the
symbol pair {0x000A, 0xDD82}, both frequency 704). With that override the whole
block round-trips byte-identically -- see docs/text.md.
"""

import os
import re
import struct
import sys

# --- ROM layout (file offsets == VMA - 0x08000000) -------------------------
ROM_DEFAULT      = "baserom.gba"
BLOCK_START      = 0x0ED7F4   # first message bitstream
HUFFMAN_TREE     = 0x14929C   # gMsgHuffmanTable
ROOT_PTR_OFF     = 0x14D088   # gMsgHuffmanTableRoot (u32 ptr)
TEXT_TABLE       = 0x14D08C   # gMsgTable
TEXT_COUNT       = 0xD0B      # 3339 messages
ROOT_NODE        = 0xF7A      # 3962 -- root node index in gMsgHuffmanTable
BLOCK_END        = 0x1504B8   # end of gMsgTable (== end of the carved object)

THIS_DIR  = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(os.path.dirname(THIS_DIR))
TEXT_DIR  = os.path.join(REPO_ROOT, "texts")


# --- low-level ROM helpers --------------------------------------------------
def _u32(rom, off):
    return int.from_bytes(rom[off:off + 4], "little")


def _is_leaf(v):
    return (v & 0xFFFF0000) == 0xFFFF0000


def _pr_off(rom, addr):
    return _u32(rom, addr) & 0xFFFFFF


def read_huffman_table(rom):
    return [_u32(rom, HUFFMAN_TREE + 4 * i) for i in range(ROOT_NODE + 1)]


def decode_message(rom, table, off):
    """Decode one Huffman bitstream into its u16 symbol list (terminator 0 kept)."""
    out = []
    bit_pos = -1
    cur = ROOT_NODE
    cur_byte = 0
    while True:
        if bit_pos < 0:
            cur_byte = rom[off]
            off += 1
            bit_pos = 7
        bit = cur_byte & 1
        cur_byte >>= 1
        bit_pos -= 1
        cur = table[cur] & 0xFFFF if bit == 0 else (table[cur] >> 16) & 0xFFFF
        if _is_leaf(table[cur]):
            data = table[cur] & 0xFFFF
            out.append(data)
            if data == 0:
                break
            cur = ROOT_NODE
    return out


def decode_all(rom, table):
    """Return [msg0_syms, msg1_syms, ...] for all TEXT_COUNT messages."""
    return [decode_message(rom, table, _pr_off(rom, TEXT_TABLE + 4 * i))
            for i in range(TEXT_COUNT)]


# --- control-token map (jp_textdefs.txt) ------------------------------------
def load_control_chars(defs_path):
    """name -> tuple of u16 values."""
    control = {}
    with open(defs_path, "r", encoding="utf-8") as f:
        for line in f:
            m = re.match(r"\[(.*?)\]\s*=\s*(.+)", line.strip())
            if m:
                control[m.group(1)] = tuple(int(v.strip(), 0) for v in m.group(2).split(","))
    return control


def load_tiebreaks(path):
    """Load Huffman tie-break overrides: each line 'left_sym right_sym' (hex).

    Means: when the frequency-driven builder pops the equal-frequency leaf pair
    {left_sym, right_sym}, force `left_sym` to be the left (bit-0) child.
    """
    overrides = {}
    if not os.path.isfile(path):
        return overrides
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.split("#", 1)[0].strip()
            if not line:
                continue
            a, b = (int(x, 0) for x in line.split())
            overrides[frozenset((a, b))] = (a, b)
    return overrides


# --- u16 symbol stream <-> bracket-annotated CP932 string -------------------
# Control codes that occupy the low byte range and must be emitted as tokens.
# Built (name<->value) from the loaded textdefs; the inverse map prefers the
# first name listed for a given value so the dump is stable.

def build_inverse_control(control):
    """single-u16 value -> token name, for the common named control codes.

    Only single-value tokens are inverted (face-control prefixes like 0x80/0x10
    are emitted as explicit [$XXXX] raw tokens so the dump stays unambiguous and
    round-trips exactly regardless of what follows them)."""
    inv = {}
    for name, vals in control.items():
        if len(vals) == 1 and vals[0] not in inv:
            inv[vals[0]] = name
    return inv


def _is_cp932(v):
    """True if the u16 (little-endian byte pair) is a genuine 2-byte CP932 char.

    Requires a valid CP932 lead byte (0x81-0x9F or 0xE0-0xFC) in the LOW byte
    (the symbol is stored little-endian, so byte order on disk is lo, hi and the
    CP932 lead byte is the first on-disk byte == lo), and that the pair decodes
    to exactly one non-control character. This rejects FID/face sequences such
    as 0x015B that CP932 would otherwise mis-decode to '[\\x01'."""
    lo = v & 0xFF
    hi = (v >> 8) & 0xFF
    if hi == 0:
        return False
    if not ((0x81 <= lo <= 0x9F) or (0xE0 <= lo <= 0xFC)):
        return False
    try:
        ch = bytes((lo, hi)).decode("cp932")
    except UnicodeDecodeError:
        return False
    return len(ch) == 1 and (ord(ch) >= 0x20)


def symbols_to_text(syms, inv_control):
    """u16 symbol list (WITHOUT trailing 0) -> bracket-annotated CP932 string.

    Rules (chosen for unambiguous, byte-exact round-trip):
      * a u16 that decodes as a CP932 character is emitted as that character;
      * a u16 that is a named single-byte control code -> its [Token];
      * anything else (face-control prefixes 0x80/0x10, FIDs, stray bytes) ->
        an explicit raw token [$XXXX].
    """
    out = []
    for v in syms:
        if _is_cp932(v):
            out.append(bytes((v & 0xFF, (v >> 8) & 0xFF)).decode("cp932"))
        elif v in inv_control:
            out.append("[" + inv_control[v] + "]")
        else:
            out.append("[$%04X]" % v)
    return "".join(out)


_RAW_RE = re.compile(r"^\$([0-9A-Fa-f]{1,4})$")


def text_to_symbols(text, control):
    """bracket-annotated CP932 string -> u16 symbol list (WITHOUT trailing 0)."""
    pattern = re.compile(r"\[(.*?)\]")
    syms = []
    pos = 0
    while pos < len(text):
        m = pattern.search(text, pos)
        if m:
            preceding = text[pos:m.start()]
            if preceding:
                b = preceding.encode("cp932")
                syms.extend(struct.unpack("%dH" % (len(b) // 2), b))
            token = m.group(1)
            raw = _RAW_RE.match(token)
            if raw:
                syms.append(int(raw.group(1), 16))
            elif token in control:
                syms.extend(control[token])
            else:
                raise ValueError("unknown control token [%s]" % token)
            pos = m.end()
        else:
            remaining = text[pos:]
            if remaining:
                b = remaining.encode("cp932")
                syms.extend(struct.unpack("%dH" % (len(b) // 2), b))
            break
    return syms


# --- Huffman tree build (frequency-driven + tie-break overrides) ------------
class _Node:
    __slots__ = ("sym", "freq", "left", "right", "idx")

    def __init__(self, sym, freq, left, right):
        self.sym = sym
        self.freq = freq
        self.left = left
        self.right = right
        self.idx = -1


def build_huffman(all_syms, overrides):
    """Build the Huffman node table (list of u32) reproducing the JP ROM tree.

    Leaf insertion order and the stable-after-equals linked-list merge mirror the
    US texttools builder; `overrides` (from jp_huffman_tiebreaks.txt) fixes the
    single equal-frequency leaf pair the simplified model would otherwise swap.
    Returns (table_u32_list, root_node)."""
    freq = [0] * 0x10000
    for v in all_syms:
        freq[v] += 1

    nodes = []

    def mk_leaf(sym):
        n = _Node(sym, freq[sym], None, None)
        nodes.append(n)
        return n

    def mk_inner(l, r):
        n = _Node(None, l.freq + r.freq, l, r)
        nodes.append(n)
        return n

    # leaf enumeration order: 0x00-0xFF, then 0x100-0x1FF, then (hi<<8)|lo hi>=2
    order = []
    for i in range(0x100):
        if freq[i] > 0:
            order.append(i)
    for i in range(0x100):
        c = 0x100 | i
        if freq[c] > 0:
            order.append(c)
    for lo in range(0x100):
        for hi in range(2, 0x100):
            c = (hi << 8) | lo
            if freq[c] > 0:
                order.append(c)

    lst = []  # ascending by freq, equal-freq appended after existing (stable)

    def add(node):
        f = node.freq
        i = 0
        while i < len(lst) and lst[i].freq <= f:
            i += 1
        lst.insert(i, node)

    for sym in order:
        add(mk_leaf(sym))

    while len(lst) > 1:
        a = lst.pop(0)
        b = lst.pop(0)
        if a.sym is not None and b.sym is not None:
            key = frozenset((a.sym, b.sym))
            if key in overrides:
                ls, rs = overrides[key]
                if a.sym == rs and b.sym == ls:
                    a, b = b, a
        add(mk_inner(a, b))
    root = lst[0]

    for i, n in enumerate(nodes):
        n.idx = i
    table = []
    for n in nodes:
        if n.left is None:
            table.append(0xFFFF0000 | n.sym)
        else:
            table.append((n.right.idx << 16) | n.left.idx)
    return table, root


def build_code_table(root):
    codes = {}

    def rec(node, path):
        if node.left is None:
            codes[node.sym] = path
            return
        rec(node.left, path + "0")
        rec(node.right, path + "1")

    rec(root, "")
    return codes


def compress(syms, codes):
    """syms must include the trailing 0 terminator. Returns list of u8."""
    bits = 0
    bit_count = 0
    out = []
    for v in syms:
        for ch in codes[v]:
            if ch == "1":
                bits |= (1 << bit_count)
            bit_count += 1
            if bit_count == 8:
                out.append(bits)
                bits = 0
                bit_count = 0
    if bit_count > 0:
        out.append(bits)
    return out


# --- whole-block assembly (bitstreams + suffix dedup + tree + table) --------
def assemble_block(messages_syms, codes, table):
    """Reproduce the exact msg_data block bytes.

    messages_syms[i] = full u16 list for message i INCLUDING the trailing 0.
    Returns (block_bytes, msg_vmas) where msg_vmas[i] is the VMA stored in
    gMsgTable for message i (0x08000000-based)."""
    # 1. compress each message
    comp = [bytes(compress(m, codes)) for m in messages_syms]

    # 2. lay out bitstreams in message-index order (the ROM stores them strictly
    #    ascending). Suffix sharing: if message i's compressed bytes are an exact
    #    suffix of the immediately-preceding message, point INTO that message
    #    rather than emitting a copy -- the byte stream is shared and the next
    #    message continues from the predecessor's end. The ROM does exactly one
    #    such share (msg 0x63A inside 0x639).
    blob = bytearray()
    offset_of = [None] * len(comp)
    prev_start = None
    prev_bytes = None
    for i, c in enumerate(comp):
        if (prev_bytes is not None and len(c) < len(prev_bytes)
                and prev_bytes.endswith(c)):
            offset_of[i] = prev_start + (len(prev_bytes) - len(c))
        else:
            start = len(blob)
            blob += c
            offset_of[i] = start
            prev_start = start
            prev_bytes = c

    # 3. pad to 4-byte alignment for the tree (ROM uses a single 0x00 here)
    while len(blob) % 4 != 0:
        blob.append(0)
    tree_off = len(blob)

    # 4. tree (u32 LE) then root pointer then table
    tree_bytes = b"".join(struct.pack("<I", w) for w in table)
    blob += tree_bytes
    root_node_off = tree_off + 4 * (len(table) - 1)
    # gMsgHuffmanTableRoot pointer
    blob += struct.pack("<I", 0x08000000 + BLOCK_START + root_node_off)
    table_off = len(blob)

    # 5. message pointer table (VMA == BLOCK_START + bitstream offset)
    msg_vmas = [0x08000000 + BLOCK_START + offset_of[i] for i in range(len(comp))]
    for vma in msg_vmas:
        blob += struct.pack("<I", vma)

    return bytes(blob), msg_vmas, tree_off, table_off


# --- asm emitter ------------------------------------------------------------
def emit_asm(block_bytes, out_path):
    """Emit the carved msg_data .s: the whole block as .byte data, with the
    gMsgTable global at its known offset so existing relocations resolve."""
    table_rel = TEXT_TABLE - BLOCK_START
    lines = []
    lines.append("\t.section .rodata.msg_data, \"a\", %progbits")
    lines.append("@ FE8 JP message text, Huffman tree and gMsgTable.")
    lines.append("@ GENERATED from texts/jp_texts.txt by scripts/texttools/msg_jp.py")
    lines.append("@   (build); re-encodes byte-identically to the original ROM block")
    lines.append("@   0x080ED7F4..0x081504B8.  DO NOT EDIT BY HAND -- edit texts/jp_texts.txt.")
    lines.append("\t.global gMsgData")
    lines.append("gMsgData:")

    def dump_run(data, base_label_offsets):
        # emit .byte lines, 16 bytes per line, inserting labels at given offsets
        i = 0
        n = len(data)
        labels = dict(base_label_offsets)
        while i < n:
            if i in labels:
                lines.append("%s:" % labels[i])
            chunk = data[i:i + 16]
            lines.append("\t.byte " + ", ".join("0x%02X" % b for b in chunk))
            i += 16
            # if a label falls mid-chunk we would miss it; ensure alignment below
        # handle labels that didn't fall on a 16-byte boundary
    # Simpler/robust: split emission at the gMsgTable label boundary.
    pre = block_bytes[:table_rel]
    post = block_bytes[table_rel:]

    def emit_bytes(data):
        for i in range(0, len(data), 16):
            chunk = data[i:i + 16]
            lines.append("\t.byte " + ", ".join("0x%02X" % b for b in chunk))

    emit_bytes(pre)
    lines.append("\t.global gMsgTable")
    lines.append("gMsgTable:")
    emit_bytes(post)
    lines.append("")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))


# --- CLI drivers ------------------------------------------------------------
def _load_rom(path):
    with open(path, "rb") as f:
        return f.read()


def cmd_dump(rom_path, texts_path, defs_path, tiebreaks_path):
    """ROM -> human-readable source (jp_texts.txt + jp_huffman_tiebreaks.txt)."""
    rom = _load_rom(rom_path)
    table = read_huffman_table(rom)
    msgs = decode_all(rom, table)
    control = load_control_chars(defs_path)
    inv = build_inverse_control(control)

    with open(texts_path, "w", encoding="utf-8") as f:
        f.write("// FE8 JP (Seima no Kouseki) in-game message text.\n")
        f.write("// GENERATED from baserom.gba by scripts/texttools/msg_jp.py dump.\n")
        f.write("// Re-encodes byte-identically; control tokens in texts/jp_textdefs.txt,\n")
        f.write("// Huffman tie-break overrides in texts/jp_huffman_tiebreaks.txt.\n")
        f.write("// %d messages.\n\n" % len(msgs))
        for idx, m in enumerate(msgs):
            text = symbols_to_text(m[:-1], inv)  # drop trailing terminator
            f.write("#0x%04X\n" % idx)
            f.write(text + "\n")

    # tie-break override file: derive it by comparing the no-override build to ROM
    all_syms = []
    for m in msgs:
        all_syms.extend(m)
    no_ov, _ = build_huffman(all_syms, {})
    overrides = []
    if no_ov != table:
        for i, (a, b) in enumerate(zip(no_ov, table)):
            if a != b and not _is_leaf(a) and not _is_leaf(b):
                # order-only swap: same children, opposite L/R
                la, ra = a & 0xFFFF, (a >> 16) & 0xFFFF
                lb, rb = b & 0xFFFF, (b >> 16) & 0xFFFF
                if {la, ra} == {lb, rb} and _is_leaf(table[lb]) and _is_leaf(table[rb]):
                    left_sym = table[lb] & 0xFFFF
                    right_sym = table[rb] & 0xFFFF
                    overrides.append((left_sym, right_sym))
    with open(tiebreaks_path, "w", encoding="utf-8") as f:
        f.write("# Huffman tie-break overrides for the JP message tree.\n")
        f.write("# Each line: <left_sym> <right_sym> (hex). When the frequency-\n")
        f.write("# driven builder pops this equal-frequency leaf PAIR, force the\n")
        f.write("# first symbol to be the left (bit-0) child -- matching the\n")
        f.write("# original ROM encoder's resolution of an otherwise-ambiguous tie.\n")
        f.write("# See docs/text.md. Both orderings are optimal Huffman trees;\n")
        f.write("# this picks the ROM's so the bitstream is byte-identical.\n")
        for ls, rs in overrides:
            f.write("0x%04X 0x%04X\n" % (ls, rs))
    return len(msgs), overrides


def _process_texts(texts_path, control):
    """Parse jp_texts.txt -> list of u16 symbol lists (each WITH trailing 0)."""
    messages = {}
    with open(texts_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    cur = None
    buf = []

    def flush():
        if cur is not None:
            text = "".join(buf)
            syms = text_to_symbols(text, control)
            syms.append(0)  # terminator
            messages[cur] = syms

    for line in lines:
        s = line.rstrip("\n")
        st = s.strip()
        if st.startswith("//"):
            continue
        m = re.match(r"^#0x([0-9A-Fa-f]+)\s*$", st)
        if m:
            flush()
            cur = int(m.group(1), 16)
            buf = []
        else:
            buf.append(s)
    flush()
    return [messages[i] for i in sorted(messages)]


def cmd_build(texts_path, defs_path, tiebreaks_path, out_asm):
    """texts -> byte-exact asm/msg_data.s (the carved data object)."""
    control = load_control_chars(defs_path)
    overrides = load_tiebreaks(tiebreaks_path)
    messages = _process_texts(texts_path, control)
    all_syms = []
    for m in messages:
        all_syms.extend(m)
    table, root = build_huffman(all_syms, overrides)
    codes = build_code_table(root)
    block, vmas, tree_off, table_off = assemble_block(messages, codes, table)
    emit_asm(block, out_asm)
    return len(messages), len(block)


def cmd_verify(rom_path, texts_path, defs_path, tiebreaks_path):
    """Build from texts and diff the block against the ROM. Returns True if exact."""
    control = load_control_chars(defs_path)
    overrides = load_tiebreaks(tiebreaks_path)
    messages = _process_texts(texts_path, control)
    all_syms = []
    for m in messages:
        all_syms.extend(m)
    table, root = build_huffman(all_syms, overrides)
    codes = build_code_table(root)
    block, vmas, tree_off, table_off = assemble_block(messages, codes, table)
    rom = _load_rom(rom_path)
    rom_block = rom[BLOCK_START:BLOCK_END]
    return block == rom_block, len(block), len(rom_block)


def main(argv):
    defs = os.path.join(TEXT_DIR, "jp_textdefs.txt")
    texts = os.path.join(TEXT_DIR, "jp_texts.txt")
    tiebreaks = os.path.join(TEXT_DIR, "jp_huffman_tiebreaks.txt")
    out_asm = os.path.join(REPO_ROOT, "asm", "msg_data.s")
    rom = os.path.join(REPO_ROOT, ROM_DEFAULT)
    cmd = argv[0] if argv else "build"

    if cmd == "dump":
        n, ov = cmd_dump(rom, texts, defs, tiebreaks)
        print("dumped %d messages -> %s" % (n, texts))
        print("tie-break overrides: %d -> %s" % (len(ov), tiebreaks))
    elif cmd == "build":
        n, sz = cmd_build(texts, defs, tiebreaks, out_asm)
        print("built %d messages (%d bytes) -> %s" % (n, sz, out_asm))
    elif cmd == "verify":
        ok, a, b = cmd_verify(rom, texts, defs, tiebreaks)
        print("byte-identical: %s (rebuilt %d, rom %d)" % (ok, a, b))
        sys.exit(0 if ok else 1)
    else:
        sys.exit("usage: msg_jp.py {dump|build|verify}")


if __name__ == "__main__":
    main(sys.argv[1:])
