#include "global.h"

/* Migrated from asm/data_08A64420.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A64420, \"aw\", %progbits\n"
"\t.global EventScr_Ch5_6\n"
"EventScr_Ch5_6:\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x3C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch5_6: ptr=2 data=4 skip=0 */
__asm__(
"\t.section .data.residue.08A64438, \"aw\", %progbits\n"
"\t.global EventScr_Ch5_7\n"
"EventScr_Ch5_7:\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x78\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch5_7: ptr=2 data=4 skip=0 */
u32 EventScr_Ch5_8[] __attribute__((section(".data.residue.08A64450"))) = {
    0x00001A23, 0x000B0540, 0xFFFFFFFF, 0x09911B20,
    0x00001D20, 0x00001B22, 0x00DB0229, 0x00BD0229,
    0x00000120,
};
u32 EventScr_Ch5_9[] __attribute__((section(".data.residue.08A64474"))) = {
    0x00001A23, 0x000B0540, 0xFFFFFFFF, 0x09921B20,
    0x00001D20, 0x00001B22, 0x00BB0229, 0x00000120,
};
