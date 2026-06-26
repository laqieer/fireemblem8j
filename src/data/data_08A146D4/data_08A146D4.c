#include "global.h"

/* Migrated from asm/data_08A146D4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A146D4, \"aw\", %progbits\n"
"\t.global data_08A146D4\n"
"data_08A146D4:\n"
"\t.4byte 0x00000002\n"
"\t.4byte SpellAssocResetPalMain + 0x1\n"
"\t.4byte 0x0010000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte BG0Shaker_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte BG0Shaker_Loop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte LockGame + 0x1\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnimRotation_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte MapAnimRotation_Main + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte UnlockGame + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A146D4: ptr=7 data=17 skip=0 */
