#include "global.h"

/* Migrated from asm/data_08A5A9B4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5A9B4, \"aw\", %progbits\n"
"\t.global data_08A5A9B4\n"
"data_08A5A9B4:\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch2_EndingScene\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5A9B4: ptr=2 data=8 skip=0 */
