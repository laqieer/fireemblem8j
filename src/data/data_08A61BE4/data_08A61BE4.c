#include "global.h"

/* Migrated from asm/data_08A61BE4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A61BE4, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Misc_DefeatBoss\n"
"EventScr_Ch1_Misc_DefeatBoss:\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch1Tut_GuideMsgSeize\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Misc_DefeatBoss: ptr=2 data=4 skip=0 */
