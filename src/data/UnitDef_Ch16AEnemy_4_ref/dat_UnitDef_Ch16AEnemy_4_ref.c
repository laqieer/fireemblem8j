#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AEnemy_4\n"
"UnitDef_Ch16AEnemy_4:\n"
"\t.4byte 0x7D00058D\n"
"\t.4byte 0x010006CE\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0xA8\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x7D00058D\n"
"\t.4byte 0x010006CE\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0xB0\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x7D00058D\n"
"\t.4byte 0x010006D0\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0xB8\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
