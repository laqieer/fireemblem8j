#include "global.h"

/* Migrated from asm/data_08A5B2B4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5B2B4, \"aw\", %progbits\n"
"\t.global data_08A5B2B4\n"
"data_08A5B2B4:\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch10A_0\n"
"\t.4byte 0x00800001\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch10A_12\n"
"\t.4byte 0x00000502\n"
"\t.4byte 0x000D0002\n"
"\t.4byte EventScr_Ch10A_8\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte EventScr_Ch10A_14\n"
"\t.4byte 0x0080FF01\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5B2B4: ptr=4 data=9 skip=0 */
