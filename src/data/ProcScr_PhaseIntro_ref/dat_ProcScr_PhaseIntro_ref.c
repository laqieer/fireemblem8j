#include "global.h"

/* De-pointered from data/residual/ProcScr_PhaseIntro.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_ProcScr_PhaseIntro_ref, \"a\", %progbits\n"
"\t.global ProcScr_PhaseIntro\n"
"ProcScr_PhaseIntro:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntro_EndIfNoUnits + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntro_InitGraphics + 0x1\n"
"\t.4byte 0x00000005\n"
"\t.4byte gProcScr_PhaseIntroText\n"
"\t.4byte 0x00000005\n"
"\t.4byte gProcScr_PhaseIntroSquares\n"
"\t.4byte 0x00000005\n"
"\t.4byte gProcScr_PhaseIntroBlendBox\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntro_InitDisp + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntro_WaitForEnd + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMapSongBgm + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
