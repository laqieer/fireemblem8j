#include "global.h"

/* De-pointered from data/residual/gProcScr_PhaseIntroText.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gProcScr_PhaseIntroText_ref, \"a\", %progbits\n"
"\t.global gProcScr_PhaseIntroText\n"
"gProcScr_PhaseIntroText:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroInitText + 0x1\n"
"\t.4byte 0x0006000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroText_PutText + 0x1\n"
"\t.4byte 0x00000005\n"
"\t.4byte obj_Phasechangefx_0 + 0x20\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroText_InLoop + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroText_OutLoop + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroClearText + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
