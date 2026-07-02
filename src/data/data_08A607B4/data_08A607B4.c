#include "global.h"

/* Migrated from asm/data_08A607B4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A607B4, \"aw\", %progbits\n"
"\t.global EventScr_ChangeAIinQueue\n"
"EventScr_ChangeAIinQueue:\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00010C44\n"
"\t.4byte 0x0000000D\n"
"\t.4byte 0x00210620\n"
"\t.4byte 0x000B0722\n"
"\t.4byte 0xFFFF3921\n"
"\t.4byte 0x00000920\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00000120\n"
);
__asm__(
"\t.section .data.residue.08A607D8, \"aw\", %progbits\n"
"\t.global EventScr_9EE6A0\n"
"EventScr_9EE6A0:\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_ChangeAIinQueue\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00420620\n"
"\t.4byte 0xFFFF0221\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_9EE6A0: ptr=1 data=9 skip=0 */
__asm__(
"\t.section .data.residue.08A60800, \"aw\", %progbits\n"
"\t.global EventScr_9EE6C8\n"
"EventScr_9EE6C8:\n"
"\t.4byte 0x00002E21\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_ChangeAIinQueue\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00420620\n"
"\t.4byte 0xFFFF0221\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_9EE6C8: ptr=1 data=10 skip=0 */
