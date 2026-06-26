#include "global.h"

/* Migrated from asm/data_08A611DC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A611DC, \"aw\", %progbits\n"
"\t.global data_08A611DC\n"
"data_08A611DC:\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Event_PrologueEnemy\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00683B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00131220\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08D01B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00040221\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice data_08A611DC: ptr=1 data=11 skip=1 */
