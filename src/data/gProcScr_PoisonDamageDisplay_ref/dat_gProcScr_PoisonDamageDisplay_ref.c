#include "global.h"

/* De-pointered from data/residual/gProcScr_PoisonDamageDisplay.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gProcScr_PoisonDamageDisplay_ref, \"a\", %progbits\n"
"\t.global gProcScr_PoisonDamageDisplay\n"
"gProcScr_PoisonDamageDisplay:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PoisonDamageDisplay_Init + 0x1\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte MassEffectDisplay_Check + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte MassEffectDisplay_Watch + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PoisonDamageDisplay_Display + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte FinishDamageDisplay + 0x1\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PoisonDamageDisplay_Next + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
