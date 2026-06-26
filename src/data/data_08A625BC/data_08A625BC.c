#include "global.h"

/* Migrated from asm/data_08A625BC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A625BC, \"aw\", %progbits\n"
"\t.global EventScr_Ch2_Turn1Player\n"
"EventScr_Ch2_Turn1Player:\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_08A62808 + 0x100\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2_Turn1Player: ptr=2 data=4 skip=0 */
__asm__(
"\t.section .data.residue.08A625D4, \"aw\", %progbits\n"
"\t.global EventScr_Ch2_Turn2Player\n"
"EventScr_Ch2_Turn2Player:\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch2_5\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch2_Turn2Player: ptr=2 data=4 skip=0 */
