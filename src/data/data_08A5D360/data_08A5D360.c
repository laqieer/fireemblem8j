#include "global.h"

/* Migrated from asm/data_08A5D360.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5D360, \"aw\", %progbits\n"
"\t.global data_08A5D360\n"
"data_08A5D360:\n"
"\t.4byte gUidebug_2 + 0x648\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0x68\n"
"\t.4byte UnitDef_Ch19BAlly\n"
"\t.4byte UnitDef_Ch19BAlly\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte EventScr_Ch18b_BeginningScene\n"
"\t.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x1C\n"
);  /* de-pointered slice data_08A5D360: ptr=6 data=6 skip=0 */
