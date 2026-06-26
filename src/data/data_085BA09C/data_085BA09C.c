#include "global.h"

/* Migrated from asm/data_085BA09C.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085BA09C, \"aw\", %progbits\n"
"\t.global data_085BA09C\n"
"data_085BA09C:\n"
"\t.4byte 0x00000002\n"
"\t.4byte ItemGot_DisplayLePopup + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ItemGot_GotLeItem + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_085BA09C: ptr=2 data=8 skip=0 */
