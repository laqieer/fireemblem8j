#include "global.h"

/* Migrated from asm/data_085C33C0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085C33C0, \"aw\", %progbits\n"
"\t.global gProcScr_PhaseIntroSquares\n"
"gProcScr_PhaseIntroSquares:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroBlendBox_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroSquares_InLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroSquares_OutLoop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice gProcScr_PhaseIntroSquares: ptr=3 data=5 skip=0 */
__asm__(
"\t.section .data.residue.085C33E0, \"aw\", %progbits\n"
"\t.global gProcScr_PhaseIntroBlendBox\n"
"gProcScr_PhaseIntroBlendBox:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroSquares_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroBlendBox_InLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroBlendBox_OutLoop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice gProcScr_PhaseIntroBlendBox: ptr=3 data=5 skip=0 */
