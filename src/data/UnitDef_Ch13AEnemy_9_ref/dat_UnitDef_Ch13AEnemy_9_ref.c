#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch13AEnemy_9.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch13AEnemy_9_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch13AEnemy_9\n"
"UnitDef_Ch13AEnemy_9:\n"
"\t.4byte 0x55001F80\n"
"\t.4byte 0x01000340\n"
"\t.4byte data_0890ECE8 + 0x108\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x5D001F0E\n"
"\t.4byte 0x010023C0\n"
"\t.4byte data_0890ECE8 + 0x110\n"
"\t.4byte 0x0000671A\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x55001F80\n"
"\t.4byte 0x010003C2\n"
"\t.4byte data_0890ECE8 + 0x118\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
