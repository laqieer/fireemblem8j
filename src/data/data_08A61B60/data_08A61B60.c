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
u32 EventScr_Ch1_Turn1Enemy[] __attribute__((section(".data.residue.08A61B78"))) = {
    0x00131220, 0x00463B21, 0x003C0E20, 0x00003B22,
    0x00001A20, 0x08F01B20, 0x00001D20, 0x00001B22,
    0x00070228, 0x00000120,
};
