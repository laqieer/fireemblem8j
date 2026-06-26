#include "global.h"

/* Migrated from asm/data_085D1EA4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* First 24 B (0x5D1EA4-0x5D1EBC) carved as cp_decide.o(.data) sDecideFuncList; tail kept here. */
__asm__(
"\t.section .data.residue.085D1EBC, \"aw\", %progbits\n"
"\t.global data_085D1EBC\n"
"data_085D1EBC:\n"
"\t.4byte DecideSpecialItems + 0x1\n"
"\t.4byte DecideScriptA + 0x1\n"
"\t.4byte DecideHealOrEscape + 0x1\n"
"\t.4byte DecideScriptB + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_080DCDAC\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte CpDecide_Main + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte CpDecide_Suspend + 0x1\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_085D1EBC: ptr=5 data=13 skip=2 */
