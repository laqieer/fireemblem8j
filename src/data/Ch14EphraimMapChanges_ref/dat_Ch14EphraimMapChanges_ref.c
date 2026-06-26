#include "global.h"

/* De-pointered from data/residual/Ch14EphraimMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch14EphraimMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch14EphraimMapChanges\n"
"Ch14EphraimMapChanges:\n"
"\t.4byte Ch13EphraimMapChanges + 0x50\n"
"\t.4byte Ch13EphraimMapChanges + 0xA8\n"
"\t.4byte Ch13EphraimMapChanges + 0xCC\n"
"\t.4byte Ch13EphraimMapChanges + 0x244\n"
"\t.4byte Ch13EphraimMapChanges + 0x26C\n"
"\t.4byte Ch13EphraimMapChanges + 0x270\n"
"\t.4byte Ch13EphraimMapChanges + 0x274\n"
"\t.4byte Ch13EphraimMapChanges + 0x278\n"
"\t.4byte gUidebug_2 + 0x4DE\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0x60\n"
"\t.4byte UnitDef_Ch14BAlly_0\n"
"\t.4byte UnitDef_Ch14BAlly_0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte frontier_df3_eventscr_ch_012_A6DE0C + 0x150\n"
"\t.4byte frontier_df3_eventscr_ch_012_A6DE0C + 0x340\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14b_EndingScene + 0x144\n"
"\t.4byte 0x00000503\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14b_EndingScene + 0x15C\n"
"\t.4byte 0x00000504\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch14b_EndingScene + 0x174\n"
"\t.4byte 0x00000908\n"
"\t.4byte 0x00000002\n"
);
