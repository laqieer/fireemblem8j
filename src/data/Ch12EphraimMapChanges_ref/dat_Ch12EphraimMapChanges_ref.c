#include "global.h"

/* De-pointered from data/residual/Ch12EphraimMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch12EphraimMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch12EphraimMapChanges\n"
"Ch12EphraimMapChanges:\n"
"\t.4byte 0x08A5C730\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C77C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C790\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C7C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C7E0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C7E4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C7E8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C7EC\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4DC\n"
"\t.4byte 0x08A6000B\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ch12BAlly_0\n"
"\t.4byte UnitDef_Ch12BAlly_0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6D5B4\n"  /* coincidental const into fn: raw */
"\t.4byte frontier_df3_eventscr_ch_011_A6D850\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DEE8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000807\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DF00\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000403\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DF18\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000503\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6DF30\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000603\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090003\n"
"\t.4byte frontier_df3_eventscr_ch_012_A6DE0C\n"
"\t.4byte 0x0000140F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090003\n"
"\t.4byte frontier_df3_eventscr_ch_012_A6DE0C\n"
"\t.4byte 0x00000F14\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A0003\n"
"\t.4byte 0x08A6DE30\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001614\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A0003\n"
"\t.4byte 0x08A6DE30\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001416\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B0003\n"
"\t.4byte 0x08A6DE50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001815\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B0003\n"
"\t.4byte 0x08A6DE50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001518\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x08A6DE70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00101204\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00201104\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x08A6DEAC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100D11\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200C11\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch13b_EndingScene\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x000C0001\n"
"\t.4byte 0x08A6DF48\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x0007000B\n"
"\t.4byte EventScr_Ch13B_0\n"
"\t.4byte 0x0E0B0D09\n"
"\t.4byte 0x0007000B\n"
"\t.4byte EventScr_Ch13B_0\n"
"\t.4byte 0x0C0C0A08\n"
"\t.4byte 0x0008000B\n"
"\t.4byte EventScr_Ch13B_1\n"
"\t.4byte 0x0E0B0D09\n"
"\t.4byte 0x0008000B\n"
"\t.4byte EventScr_Ch13B_1\n"
"\t.4byte 0x0C0C0A08\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
