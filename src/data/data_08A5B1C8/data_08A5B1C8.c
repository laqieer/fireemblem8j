#include "global.h"

/* Migrated from asm/data_08A5B1C8.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5B1C8, \"aw\", %progbits\n"
"\t.global data_08A5B1C8\n"
"data_08A5B1C8:\n"
"\t.4byte 0x00070003\n"
"\t.4byte EventScr_Ch9A_0\n"
"\t.4byte 0x00001201\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte EventScr_Ch9A_1\n"
"\t.4byte 0x00001204\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5B1C8: ptr=2 data=7 skip=0 */
