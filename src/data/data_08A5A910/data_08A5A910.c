#include "global.h"

/* Migrated from asm/data_08A5A910.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5A910, \"aw\", %progbits\n"
"\t.global data_08A5A910\n"
"data_08A5A910:\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch2_Turn1Player\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch2_Turn2Player\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A62808 + 0x78\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte EventScr_Ch2_Talk_EirikaRoss\n"
"\t.4byte 0x00000701\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte EventScr_Ch2_Talk_RossGarcia\n"
"\t.4byte 0x00000A07\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5A910: ptr=5 data=14 skip=0 */
