#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16BEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16BEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16BEnemy_4\n"
"UnitDef_Ch16BEnemy_4:\n"
"\t.4byte 0x1D001D8D\n"
"\t.4byte 0x010006CE\n"
"\t.4byte frontier_df3_unitdef_b_038_91B948 + 0x184\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x1D001D8D\n"
"\t.4byte 0x010006D0\n"
"\t.4byte frontier_df3_unitdef_b_038_91B948 + 0x18C\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x1D004C8D\n"
"\t.4byte 0x010006CE\n"
"\t.4byte frontier_df3_unitdef_b_038_91B948 + 0x194\n"
"\t.4byte 0x00000041\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x1D001D8D\n"
"\t.4byte 0x010006D0\n"
"\t.4byte frontier_df3_unitdef_b_038_91B948 + 0x19C\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
