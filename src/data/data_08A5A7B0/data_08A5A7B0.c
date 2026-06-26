#include "global.h"

/* Migrated from asm/data_08A5A7B0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A5A7B0, \"aw\", %progbits\n"
"\t.global data_08A5A7B0\n"
"data_08A5A7B0:\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch1_Turn1Player\n"
"\t.4byte 0x00000101\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch1_Turn1Enemy\n"
"\t.4byte 0x00800101\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch1_Turn_AllyReinforceArrive\n"
"\t.4byte 0x00000202\n"
"\t.4byte 0x000B0002\n"
"\t.4byte EventScr_Ch1_Turn_EnemyReinforceArrive\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_08A5A7B0: ptr=4 data=9 skip=0 */
