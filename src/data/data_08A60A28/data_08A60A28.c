#include "global.h"

/* Migrated from asm/data_08A60A28.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A60A28, \"aw\", %progbits\n"
"\t.global EventScr_9EE8F0\n"
"EventScr_9EE8F0:\n"
"\t.4byte 0xFFFF0321\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000D40\n"
"\t.4byte DisplayMapClearMapAnim + 0x1\n"
"\t.4byte 0x00320620\n"
"\t.4byte 0xFFFF2A21\n"
"\t.4byte 0x00000D40\n"
"\t.4byte StartRetreatProcessing + 0x1\n"
"\t.4byte 0x00000121\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_9EE8F0: ptr=2 data=10 skip=0 */
