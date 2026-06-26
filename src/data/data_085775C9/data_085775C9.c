#include "global.h"

/* Migrated from asm/data_085775C9.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 data_085775C9[] __attribute__((section(".data.residue.085775C9"))) = INCBIN_U8("data/residual/data_085775C9.bin", 0x0, 0x3);
__asm__(
"\t.section .data.residue.085775C9, \"aw\", %progbits\n"
"\t.global data_085775CC\n"
"data_085775CC:\n"
"\t.4byte 0x02024CC0\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte AsnycKeyStatusExt + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x02022CA8\n"
"\t.4byte 0x020234A8\n"
"\t.4byte 0x02023CA8\n"
"\t.4byte 0x020244A8\n"
);  /* de-pointered slice data_085775CC: ptr=1 data=10 skip=0 */
