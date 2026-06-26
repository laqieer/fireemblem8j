#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch18b_Turn.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch18b_Turn_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch18b_Turn\n"
"EventListScr_Ch18b_Turn:\n"
"\t.4byte 0x00030002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x1C\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x2C\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x44\n"
"\t.4byte 0x00000706\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x5C\n"
"\t.4byte 0x00000703\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x90\n"
"\t.4byte 0x00000804\n"
"\t.4byte 0x00000002\n"
);
