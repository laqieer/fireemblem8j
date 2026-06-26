#include "global.h"

/* Migrated from asm/data_08A61B60.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A61B60, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Turn1Player\n"
"EventScr_Ch1_Turn1Player:\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch1Tut_ChooseSethTurn1\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Turn1Player: ptr=2 data=4 skip=0 */
u8 EventScr_Ch1_Turn1Enemy[] __attribute__((section(".data.residue.08A61B78"))) = INCBIN_U8("data/residual/data_08A61B60.bin", 24, 40);
