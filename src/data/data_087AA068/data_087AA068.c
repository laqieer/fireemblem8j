#include "global.h"

/* Migrated from asm/data_087AA068.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.087AA068, \"aw\", %progbits\n"
"\t.global data_087AA068\n"
"data_087AA068:\n"
"\t.4byte AnimSprite_Tri_0 + 0x1\n"
"\t.4byte AnimSprite_Tri_1 + 0x2\n"
"\t.4byte AnimSprite_Tri_2 + 0x1\n"
"\t.4byte AnimSprite_Tri_3 + 0x1\n"
"\t.4byte AnimSprite_Tri_4 + 0x3\n"
"\t.4byte 0x287A9F92\n"
"\t.4byte 0x80000000\n"
);  /* de-pointered slice data_087AA068: ptr=5 data=2 skip=0 */
