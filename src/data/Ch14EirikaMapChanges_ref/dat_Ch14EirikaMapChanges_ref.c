#include "global.h"

/* De-pointered from data/residual/Ch14EirikaMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch14EirikaMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch14EirikaMapChanges\n"
"Ch14EirikaMapChanges:\n"
"\t.4byte 0x08A5B75C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B79C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B7C0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B890\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B8C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B8C8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B8CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B8D0\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x360\n"
"\t.4byte 0x08A5FFF1\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Event_Ch14aAlly\n"
"\t.4byte UnitDef_Event_Ch14aAlly\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte EventScr_Ch14a_BeginningScene\n"
"\t.4byte frontier_df4_menu_010_A67EEC\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A68814\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000503\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6882C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000504\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A68844\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000908\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch15A_0\n"
"\t.4byte 0x00800002\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6885C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A68874\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000604\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000D0003\n"
"\t.4byte 0x08A68750\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000D0003\n"
"\t.4byte 0x08A68750\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000010F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000E0003\n"
"\t.4byte 0x08A68774\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000020F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000E0003\n"
"\t.4byte 0x08A68774\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F02\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000F0003\n"
"\t.4byte 0x08A68794\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000100F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000F0003\n"
"\t.4byte 0x08A68794\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F10\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100003\n"
"\t.4byte 0x08A687B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000110F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100003\n"
"\t.4byte 0x08A687B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F11\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00110003\n"
"\t.4byte 0x08A687D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000B0F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00110003\n"
"\t.4byte 0x08A687D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F0B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00120003\n"
"\t.4byte 0x08A687F4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000E1D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00120003\n"
"\t.4byte 0x08A687F4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D0E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x08A686C4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100E01\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200D01\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F986\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00170408\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A68700\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100611\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A68728\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100D05\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch15A_1\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x0015000B\n"
"\t.4byte EventScr_Ch15A_19\n"
"\t.4byte 0x0A170714\n"
"\t.4byte 0x0016000B\n"
"\t.4byte EventScr_Ch15A_20\n"
"\t.4byte 0x02020000\n"
"\t.4byte 0x0019000B\n"
"\t.4byte EventScr_Ch15A_23\n"
"\t.4byte 0x02160012\n"
"\t.4byte 0x0018000B\n"
"\t.4byte EventScr_Ch15A_22\n"
"\t.4byte 0x0B010900\n"
"\t.4byte 0x0013000B\n"
"\t.4byte EventScr_Ch15A_17\n"
"\t.4byte 0x0C090905\n"
"\t.4byte 0x001B000B\n"
"\t.4byte EventScr_Ch15A_24\n"
"\t.4byte 0x0F0A0E08\n"
"\t.4byte 0x0014000B\n"
"\t.4byte EventScr_Ch15A_18\n"
"\t.4byte 0x0D120B0E\n"
"\t.4byte 0x0017000B\n"
"\t.4byte EventScr_Ch15A_21\n"
"\t.4byte 0x15170F16\n"
"\t.4byte 0x001A000B\n"
"\t.4byte 0x08A6888C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x150E110B\n"
"\t.4byte 0x001A000B\n"
"\t.4byte 0x08A6888C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x15150E0F\n"
"\t.4byte 0x001C000B\n"
"\t.4byte EventScr_Ch15A_25\n"
"\t.4byte 0x07000400\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
