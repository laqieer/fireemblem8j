#include "global.h"

/* Migrated from asm/data_08A63088.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A63088, \"aw\", %progbits\n"
"\t.global data_08A63088\n"
"data_08A63088:\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000D40\n"
"\t.4byte PlayPhaseForcePressAButtonInRangeDisp + 0x1\n"
"\t.4byte 0xFFFD3D20\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00040B41\n"
"\t.4byte data_08A63088 + 0x20\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00380010\n"
"\t.4byte 0x093A1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x010A1120\n"
"\t.4byte 0x00010B41\n"
"\t.4byte EventScr_Ch2Tutorial21\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice data_08A63088: ptr=3 data=17 skip=0 */
