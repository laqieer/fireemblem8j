#include "global.h"

/* Migrated from asm/data_08A61C70.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u32 EventScr_Ch1_Talk_SethFranz[] __attribute__((section(".data.residue.08A61C70"))) = {
    0x00001520, 0x00001A20, 0x08FA1B20, 0x00001D20,
    0x00001B22, 0x00001521, 0x00070228, 0x00000120,
};
u32 EventScr_Ch1_Talk_EirikaFranz[] __attribute__((section(".data.residue.08A61C90"))) = {
    0x00001520, 0x00001A20, 0x08F91B20, 0x00001D20,
    0x00001B22, 0x00001521, 0x00070228, 0x00000120,
};
__asm__(
"\t.section .data.residue.08A61CB0, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Loca_Visit1\n"
"EventScr_Ch1_Loca_Visit1:\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000008FB\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Loca_Visit1: ptr=1 data=10 skip=0 */
__asm__(
"\t.section .data.residue.08A61CDC, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Loca_Visit2\n"
"EventScr_Ch1_Loca_Visit2:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000008FC\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Loca_Visit2: ptr=1 data=9 skip=0 */
__asm__(
"\t.section .data.residue.08A61D04, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Misc_Area\n"
"EventScr_Ch1_Misc_Area:\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_UnTriggerIfNotUnit\n"
"\t.4byte 0x000B0221\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Misc_Area: ptr=1 data=6 skip=0 */
__asm__(
"\t.section .data.residue.08A61D20, \"aw\", %progbits\n"
"\t.global EventScr_Ch1_Turn_EnemyReinforceArrive\n"
"EventScr_Ch1_Turn_EnemyReinforceArrive:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Event_Ch1EnemyReinforce\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00833B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08F41B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1_Turn_EnemyReinforceArrive: ptr=2 data=12 skip=1 */
u32 EventScr_Ch1Tut_GuideWTA[] __attribute__((section(".data.residue.08A61D5C"))) = {
    0x00001A23, 0x000B0540, 0xFFFFFFFF, 0x08FD1B20,
    0x00001D20, 0x00001B22, 0x00BA0229, 0x00000120,
};
