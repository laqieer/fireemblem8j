# JP message text (Huffman) extraction

FE8 stores its in-game message text Huffman-compressed in ROM. This documents
the JP (Seima no Kouseki) format and how the decomp rebuilds the block
**byte-identically from committed source** — no `baserom.gba` dependency.

## Pipeline

```
texts/jp_texts.txt          (bracket-annotated CP932 strings, 3339 messages)
texts/jp_textdefs.txt       (control-token name -> u16 value map)
texts/jp_huffman_tiebreaks.txt (1 documented tie-break override)
        |
        |  scripts/texttools/msg_jp.py build-c   (no baserom.gba)
        v
src/msg_data.c              (compiled C: 3339 CompressedText_MSG arrays +
                             gMsgHuffmanTable + gMsgHuffmanTableRoot + gMsgTable)
        |  agbcc + as + ld
        v
ROM block 0x080ED7F4 .. 0x081504B8   (byte-identical to original)
```

`src/msg_data.c` has the **same shape as the US `src/msg_data.c`** (D70): the
message block is emitted as genuine compiled-C data — `static const u8`
bitstream arrays in message order, the `const u32 gMsgHuffmanTable[]`, the
`gMsgHuffmanTableRoot` pointer, and the `const u8 * const gMsgTable[]` pointer
table. agbcc lays the static arrays back-to-back with no inter-array padding,
then a single `.align 2` before the `u32` tables, so the compiled `.rodata`
reproduces the contiguous bitstream blob + the lone pad byte; the `gMsgTable`
and root pointers resolve to the ROM addresses at link time. This makes the
~404 KB block count as genuinely *extracted* data (it comes from `src/*.o`),
not an opaque `.byte` asm blob.

`src/msg_data.c` is **committed** (like the US) so the `src/*.c` build wildcard
sees it on a fresh checkout with no `baserom.gba` dependency; the Makefile
regenerates it from `texts/jp_*.txt` whenever the text source changes (`msg_jp.py
build-c`). `make text-verify` rebuilds the block from text and asserts
byte-identity against `baserom.gba`. The legacy `msg_jp.py build` still emits the
descriptive `asm/msg_data.s` form for reference/debugging, but the build no
longer uses it.

To re-dump from a ROM (e.g. after format changes): `python3
scripts/texttools/msg_jp.py dump`.

## ROM block layout (file offsets == VMA - 0x08000000)

| range                 | content                                            |
|-----------------------|----------------------------------------------------|
| `0x0ED7F4..0x14929B`  | per-message Huffman bitstreams (index order)       |
| `0x14929B`            | one `0x00` pad byte (4-byte aligns the tree)       |
| `0x14929C..0x14D08C`  | `gMsgHuffmanTable` — 3963 `u32` nodes, root `0xF7A`|
| `0x14D088`            | `gMsgHuffmanTableRoot` `u32` ptr -> `0x0814D084`   |
| `0x14D08C..0x1504B8`  | `gMsgTable` — 3339 `u32` message pointers          |

Each tree node `u32`: a **leaf** is `0xFFFF_0000 | symbol`; an **internal** node
is `(right_index << 16) | left_index`. Decoding walks bit-by-bit from the root
(bit 0 = left, bit 1 = right) emitting a `u16` symbol at each leaf until the `0`
terminator. Symbols are CP932 (Shift-JIS) characters stored little-endian, plus
engine control codes (`0x00`-`0x1F`, `0x80`/`0x10` face-control prefixes, FIDs).

## The matching Huffman encoder (the hard part)

A byte-exact rebuild needs the encoder to reproduce **both** the tree and every
bitstream. The frequency-driven builder ported from the US texttools
(`scripts/texttools/huffman.py`: leaf list in `0x00-0xFF`, `0x100-0x1FF`,
`(hi<<8)|lo` order; stable-after-equals linked-list merge) reproduces the JP
tree at **3962 of 3963 nodes** automatically. Given the correct tree, all 3339
message bitstreams re-encode byte-identically.

The one remaining node (`0xECD`) is an **equal-frequency tie**: leaves `0x000A`
and `0xDD82` both have frequency 704, and a third freq-704 node (`0xE73`) is in
play at the same merge. The original ROM encoder's linked-list resolved this
tie as `left=0xDD82, right=0x000A`; the simplified Python model resolves it the
opposite way. Both are optimal Huffman trees (identical code *lengths*), but the
swap changes the bit codes under that subtree and would corrupt the 537 messages
containing either symbol.

Of the tree's **1600 equal-frequency merges, exactly 1599 match** the simplified
model and **only this one** swaps — it is a genuine, isolated artifact of the
original C's pointer micro-behavior, not a systematic rule (no content key
distinguishes it from the 1599 kept pairs; both children are leaves of equal
frequency, like many others). Rather than reverse-engineer unavailable pointer
code, the encoder applies a single **content-keyed override** from
`texts/jp_huffman_tiebreaks.txt` (the symbol pair `{0x000A, 0xDD82}`). With that
override the whole 404,676-byte block round-trips **byte-identical**.

`msg_jp.py dump` re-derives the override automatically by diffing the
no-override build against the ROM, so it is reproducible, not hand-guessed.

## Bitstream suffix sharing

Messages are stored strictly in index order, but the ROM shares one suffix:
message `0x63A`'s 13 compressed bytes are an exact byte-suffix of message
`0x639`'s 21 bytes, so `gMsgTable[0x63A]` points 8 bytes into `0x639` instead of
duplicating them. `assemble_block` reproduces this by pointing a message into
its immediate predecessor whenever its bytes are an exact suffix.
