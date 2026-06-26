#include "global.h"

/* De-pointered from data/residual/ProcScr_SpellAssocVulenrary.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_ProcScr_SpellAssocVulenrary_ref, \"a\", %progbits\n"
"\t.global ProcScr_SpellAssocVulenrary\n"
"ProcScr_SpellAssocVulenrary:\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_AnimateSubjectIdle + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnimCallSpellAssocVulenrary + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_BeginRoundSpecificAnims + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte MapAnim_WaitForHPToEndChangingMaybe + 0x1\n"
"\t.4byte 0x000A000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_SubjectResetAnim + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
