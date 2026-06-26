#include "global.h"

/* Migrated from asm/data_08A62AFC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A62AFC, \"aw\", %progbits\n"
"\t.global EventScr_Ch2Tutorial6\n"
"EventScr_Ch2Tutorial6:\n"
"\t.4byte 0x00010B41\n"
"\t.4byte EventScr_Ch2Tutorial7\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2Tutorial6: ptr=1 data=3 skip=0 */
__asm__(
"\t.section .data.residue.08A62B0C, \"aw\", %progbits\n"
"\t.global EventScr_Ch2Tutorial7\n"
"EventScr_Ch2Tutorial7:\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00000B40\n"
"\t.4byte EventScr_Ch2_4\n"
"\t.4byte 0x00B80229\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2Tutorial7: ptr=1 data=5 skip=0 */
__asm__(
"\t.section .data.residue.08A62B24, \"aw\", %progbits\n"
"\t.global EventScr_Ch2_4\n"
"EventScr_Ch2_4:\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x093B1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00053B25\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020B41\n"
"\t.4byte EventScr_Ch2Tutorial8\n"
"\t.4byte 0x40003D20\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2_4: ptr=1 data=13 skip=0 */
