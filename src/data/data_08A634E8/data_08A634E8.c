#include "global.h"

/* Migrated from asm/data_08A634E8.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A634E8, \"aw\", %progbits\n"
"\t.global EventScr_Ch3_Turn2Player\n"
"EventScr_Ch3_Turn2Player:\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch3_7\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch3_Turn2Player: ptr=2 data=4 skip=0 */
