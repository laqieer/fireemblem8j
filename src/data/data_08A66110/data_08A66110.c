#include "global.h"

/* Migrated from asm/data_08A66110.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A66110, \"aw\", %progbits\n"
"\t.global EventScr_Ch9A_3\n"
"EventScr_Ch9A_3:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000009EB\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000009\n"
"\t.4byte 0xFFFF3720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch9A_3: ptr=2 data=13 skip=0 */
