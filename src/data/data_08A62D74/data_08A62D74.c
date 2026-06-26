#include "global.h"

/* Migrated from asm/data_08A62D74.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A62D74, \"aw\", %progbits\n"
"\t.global EventScr_Ch2Tutorial25\n"
"EventScr_Ch2Tutorial25:\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00380010\n"
"\t.4byte 0x09431B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x010A1120\n"
"\t.4byte 0x00010B41\n"
"\t.4byte EventScr_Ch2Tutorial26\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2Tutorial25: ptr=1 data=11 skip=0 */
__asm__(
"\t.section .data.residue.08A62DA4, \"aw\", %progbits\n"
"\t.global EventScr_Ch2Tutorial26\n"
"EventScr_Ch2Tutorial26:\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_08A62808 + 0xA0\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00003D20\n"
"\t.4byte 0x00000B40\n"
"\t.4byte EventScr_Ch2_10\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2Tutorial26: ptr=3 data=7 skip=0 */
__asm__(
"\t.section .data.residue.08A62DCC, \"aw\", %progbits\n"
"\t.global EventScr_Ch2_5\n"
"EventScr_Ch2_5:\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x09351B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00063B25\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020B41\n"
"\t.4byte EventScr_Ch2Tutorial11\n"
"\t.4byte 0x40003D20\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2_5: ptr=1 data=12 skip=0 */
