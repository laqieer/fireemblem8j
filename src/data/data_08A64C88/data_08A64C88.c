#include "global.h"

/* Migrated from asm/data_08A64C88.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A64C88, \"aw\", %progbits\n"
"\t.global data_08A64C88\n"
"data_08A64C88:\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x09B61B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00C10229\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch6Enemy_0\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice data_08A64C88: ptr=2 data=12 skip=0 */
