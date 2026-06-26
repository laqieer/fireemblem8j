#include "global.h"

/* De-pointered from data/residual/FinalChapterMap2Changes.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_FinalChapterMap2Changes_ref, \"a\", %progbits\n"
"\t.global FinalChapterMap2Changes\n"
"FinalChapterMap2Changes:\n"
"\t.4byte 0x08A5C2AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2B8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2D8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C2E0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5FCA4\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x08A60003\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891642C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891642C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6B580\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A6BFF0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A6C814\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00100002\n"
"\t.4byte 0x08A6C858\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte frontier_df3_eventscr_ch_007_A6C8CC\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00120002\n"
"\t.4byte 0x08A6C7C0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte 0x08A6C714\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000120F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte 0x08A6C73C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001204\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A6C770\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000220F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A6C770\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F22\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00110008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0012110C\n"
"\t.4byte 0x00030005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00110716\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000050\n"
"\t.4byte 0x00140107\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x09C40077\n"
"\t.4byte 0x00140112\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0012030C\n"
"\t.4byte 0x00110008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0012110D\n"
"\t.4byte 0x00110008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0012120C\n"
"\t.4byte 0x00110008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0012120D\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000097\n"
"\t.4byte 0x00140117\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000F0001\n"
"\t.4byte 0x08A6C848\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000011\n"
"\t.4byte 0x000D000B\n"
"\t.4byte EventScr_Ch9B_9\n"
"\t.4byte 0x04180306\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A6C7F4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x14111107\n"
"\t.4byte 0x000A000B\n"
"\t.4byte 0x08A6C794\n"  /* coincidental const into fn: raw */
"\t.4byte 0x10070A03\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
