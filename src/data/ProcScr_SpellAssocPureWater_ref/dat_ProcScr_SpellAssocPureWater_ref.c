#include "global.h"

/* De-pointered from data/residual/ProcScr_SpellAssocPureWater.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_ProcScr_SpellAssocPureWater_ref, \"a\", %progbits\n"
"\t.global ProcScr_SpellAssocPureWater\n"
"ProcScr_SpellAssocPureWater:\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_AnimateSubjectIdle + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnimCallSpellAssocPureWater + 0x1\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0046000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MapAnim_SubjectResetAnim + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
