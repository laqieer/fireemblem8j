#include "global.h"

/* Migrated from asm/data_08A60AB4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A60AB4, \"aw\", %progbits\n"
"\t.global EventScr_WholeTowerClear\n"
"EventScr_WholeTowerClear:\n"
"\t.4byte 0x00000D40\n"
"\t.4byte DisplayCongratulationsMapAnim + 0x1\n"
"\t.4byte 0x00000D40\n"
"\t.4byte sub_8038320 + 0x1\n"
"\t.4byte 0x00000D40\n"
"\t.4byte UnlockPostgameAllyByClearCount + 0x1\n"
"\t.4byte 0xFFFF2A21\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_WholeTowerClear: ptr=3 data=5 skip=0 */
