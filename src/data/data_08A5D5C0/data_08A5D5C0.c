#include "global.h"

/* Migrated from asm/data_08A5D5C0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5D5C0, \"aw\", %progbits\n"
"\t.global data_08A5D5C0\n"
"data_08A5D5C0:\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch21b_BeginningScene + 0xC\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5D5C0: ptr=2 data=12 skip=0 */
