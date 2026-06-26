#include "global.h"

/* De-pointered from data/residual/Ch11EphraimMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch11EphraimMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch11EphraimMapChanges\n"
"Ch11EphraimMapChanges:\n"
"\t.4byte 0x08A5C61C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C68C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6D0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6D8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C6DC\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4DA\n"
"\t.4byte 0x08A60009\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ch11BAlly_0\n"
"\t.4byte UnitDef_Ch11BAlly_0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6D164\n"  /* coincidental const into fn: raw */
"\t.4byte frontier_df3_eventscr_ch_009_A6D3F8\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D72C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00800001\n"
"\t.4byte 0x00080002\n"
"\t.4byte EventScr_Ch12B_1\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DA78\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000403\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DA90\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000604\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DAA8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000705\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DAC0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A08\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte 0x08A6D9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001618\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A6DA50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100906\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x25C\n"
"\t.4byte 0x00170104\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x08A6DA14\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100505\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200405\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte frontier_df3_eventscr_ch_011_A6D850\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
