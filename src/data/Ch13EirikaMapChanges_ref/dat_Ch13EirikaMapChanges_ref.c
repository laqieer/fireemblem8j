#include "global.h"

/* De-pointered from data/residual/Ch13EirikaMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch13EirikaMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch13EirikaMapChanges\n"
"Ch13EirikaMapChanges:\n"
"\t.4byte 0x08A5B65C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B6A8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B6DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B6E0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B6FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B700\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B704\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B708\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5FB1A\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x08A5FFED\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Event_Ch13aAlly\n"
"\t.4byte UnitDef_Event_Ch13aAlly\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678\n"
"\t.4byte 0x0890F934\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0890FBF0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0890F740\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0890F9FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0890FCB8\n"  /* coincidental const into fn: raw */
"\t.4byte frontier_df4_menu_009_A67660\n"
"\t.4byte EventScr_Ch13a_EndingScene\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14A_2\n"
"\t.4byte 0x00000805\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14A_3\n"
"\t.4byte 0x00000806\n"
"\t.4byte 0x000E0002\n"
"\t.4byte EventScr_Ch14A_7\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14A_0\n"
"\t.4byte 0x00800001\n"
"\t.4byte 0x000C0002\n"
"\t.4byte EventScr_Ch14A_5\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A682C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001C19\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte EventScr_Ch14A_1\n"
"\t.4byte 0x00001C01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00110509\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121311\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120E0A\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121302\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121116\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120816\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120212\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120211\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121809\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000057\n"
"\t.4byte 0x00140316\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000008D\n"
"\t.4byte 0x00141408\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000001D\n"
"\t.4byte 0x00140516\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F964\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00180404\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000005C\n"
"\t.4byte 0x0014140A\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000068\n"
"\t.4byte 0x00141012\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000002A\n"
"\t.4byte 0x00141002\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120114\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A000B\n"
"\t.4byte EventScr_Ch14A_8\n"
"\t.4byte 0x0B130903\n"
"\t.4byte 0x000D000B\n"
"\t.4byte EventScr_Ch14A_6\n"
"\t.4byte 0x07050000\n"
"\t.4byte 0x000B000B\n"
"\t.4byte EventScr_Ch14A_4\n"
"\t.4byte 0x180D1300\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
