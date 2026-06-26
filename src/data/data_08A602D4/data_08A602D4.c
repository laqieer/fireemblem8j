#include "global.h"

/* Migrated from asm/data_08A602D4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A602D4, \"aw\", %progbits\n"
"\t.global EventScr_UnTriggerIfNotUnit\n"
"EventScr_UnTriggerIfNotUnit:\n"
"\t.4byte 0x00002E21\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0002000C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7 + 0x1C\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_UnTriggerIfNotUnit: ptr=1 data=6 skip=0 */
