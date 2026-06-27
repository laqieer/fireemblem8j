#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch15b_Misc.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch15b_Misc_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch15b_Misc\n"
"EventListScr_Ch15b_Misc:\n"
"\t.4byte 0x000B000B\n"
"\t.4byte frontier_df3_eventscr_ch_014_A6EDFC + 0x98\n"
"\t.4byte 0x03080000\n"
"\t.4byte 0x000C000B\n"
"\t.4byte frontier_df3_eventscr_ch_015_A6EF04\n"
"\t.4byte 0x0B150405\n"
"\t.4byte 0x000C000B\n"
"\t.4byte frontier_df3_eventscr_ch_015_A6EF04\n"
"\t.4byte 0x160D1201\n"
"\t.4byte 0x000B000B\n"
"\t.4byte frontier_df3_eventscr_ch_014_A6EDFC + 0x98\n"
"\t.4byte 0x15150E0E\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte EventListScr_Ch14b_Location + 0x140\n"
"\t.4byte EventListScr_Ch14b_Location + 0x174\n"
"\t.4byte EventListScr_Ch15b_Location\n"
"\t.4byte EventListScr_Ch15b_Misc\n"
"\t.4byte EventListScr_Ch15b_Misc + 0x40\n"
"\t.4byte EventListScr_Ch15b_Misc + 0x44\n"
"\t.4byte EventListScr_Ch15b_Misc + 0x48\n"
"\t.4byte EventListScr_Ch15b_Misc + 0x4C\n"
"\t.4byte gUidebug_2 + 0x4E3\n"
"\t.4byte 0x08A60012\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ch15BAlly_0\n"
"\t.4byte UnitDef_Ch15BAlly_0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte frontier_df3_eventscr_ch_014_A6EDFC\n"
"\t.4byte 0x08A6EE54\n"  /* coincidental const into fn: raw */
);
