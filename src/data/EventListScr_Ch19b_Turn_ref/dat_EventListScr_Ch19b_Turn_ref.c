#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch19b_Turn.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch19b_Turn_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch19b_Turn\n"
"EventListScr_Ch19b_Turn:\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x1B8\n"
"\t.4byte 0x00800001\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x270\n"
"\t.4byte 0x0000150F\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x2B4\n"
"\t.4byte 0x00001610\n"
"\t.4byte 0x000A0002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x318\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x36C\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x3F4\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00100002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x47C\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x534\n"
"\t.4byte 0x00001D13\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x598\n"
"\t.4byte 0x00000605\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030005\n"
"\t.4byte 0x00000001\n"
);
