#include "global.h"

/* Migrated from asm/data_08A614C0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A614C0, \"aw\", %progbits\n"
"\t.global data_08A614C0\n"
"data_08A614C0:\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00010B41\n"
"\t.4byte data_08A614C0 + 0x10\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_Prologue_GiveRapier\n"
"\t.4byte 0x00023426\n"
"\t.4byte 0x00B70229\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x08DD1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00B40229\n"
"\t.4byte 0x00B50229\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice data_08A614C0: ptr=2 data=17 skip=1 */
