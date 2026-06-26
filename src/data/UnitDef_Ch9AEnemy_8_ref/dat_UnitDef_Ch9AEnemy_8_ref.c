#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch9AEnemy_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch9AEnemy_8_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch9AEnemy_8\n"
"UnitDef_Ch9AEnemy_8:\n"
"\t.4byte 0x4D004E83\n"
"\t.4byte 0x010005C2\n"
"\t.4byte data_0890C0A4 + 0x58\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000A0000\n"
"\t.4byte 0x4D004E85\n"
"\t.4byte 0x010005C1\n"
"\t.4byte data_0890C0A4 + 0x60\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000A0000\n"
"\t.4byte 0x4D004E84\n"
"\t.4byte 0x010005C3\n"
"\t.4byte data_0890C0A4 + 0x68\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000A0000\n"
"\t.4byte 0x0C004712\n"
"\t.4byte 0x010005C2\n"
"\t.4byte data_0890C0A4 + 0x70\n"
"\t.4byte 0x00005E15\n"
"\t.4byte 0x00100300\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
