#include "global.h"

/* De-pointered from data/residual/Ch10EphraimMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch10EphraimMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch10EphraimMapChanges\n"
"Ch10EphraimMapChanges:\n"
"\t.4byte 0x08A5C4BC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C508\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C53C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C5A0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C5BC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C5C0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C5C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C5C8\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4D8\n"
"\t.4byte 0x08A60007\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891713C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891713C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08917920\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08917BC8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08917E70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x089179E8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08917C90\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08917F38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A6C900\n"  /* coincidental const into fn: raw */
"\t.4byte frontier_df3_eventscr_ch_008_A6CD00\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch11B_1\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch11B_2\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D4C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000604\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch11B_6\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_010_A6D524\n"
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch11B_0\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D538\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D588\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D560\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte 0x08A6D474\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000190F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A6D49C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001A19\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte frontier_df3_eventscr_ch_009_A6D3F8\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
