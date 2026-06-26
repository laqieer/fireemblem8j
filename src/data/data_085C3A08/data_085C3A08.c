#include "global.h"

/* Migrated from asm/data_085C3A08.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085C3A08, \"aw\", %progbits\n"
"\t.global data_085C3A08\n"
"data_085C3A08:\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08022141\n"
"\t.4byte 0x0006000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x08022179\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMidFadeToBlack + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80221D8 + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_085C3A08: ptr=3 data=9 skip=2 */
