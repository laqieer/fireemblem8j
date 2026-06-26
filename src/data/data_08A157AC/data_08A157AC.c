#include "global.h"

/* Migrated from asm/data_08A157AC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A157AC, \"aw\", %progbits\n"
"\t.global ProcScr_EggDmgMapEffect2\n"
"ProcScr_EggDmgMapEffect2:\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_MoveCameraOnTarget + 0x1\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_StartGorgonHatchConditional + 0x1\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0032000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice ProcScr_EggDmgMapEffect2: ptr=2 data=10 skip=0 */
__asm__(
"\t.section .data.residue.08A157DC, \"aw\", %progbits\n"
"\t.global ProcScr_CritAtkMapEffect\n"
"ProcScr_CritAtkMapEffect:\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_MoveCameraOnTarget + 0x1\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_BeginRoundSpecificAnims + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte MapAnim_WaitForHPToEndChangingMaybe + 0x1\n"
"\t.4byte 0x0014000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice ProcScr_CritAtkMapEffect: ptr=3 data=11 skip=0 */
