#include "global.h"

/* Migrated from asm/data_08A5AFE4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5AFE4, \"aw\", %progbits\n"
"\t.global data_08A5AFE4\n"
"data_08A5AFE4:\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch8_0\n"
"\t.4byte 0x00000202\n"
"\t.4byte 0x000C0002\n"
"\t.4byte data_08A652C0 + 0xC4\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A652C0 + 0xDC\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5AFE4: ptr=3 data=7 skip=0 */
