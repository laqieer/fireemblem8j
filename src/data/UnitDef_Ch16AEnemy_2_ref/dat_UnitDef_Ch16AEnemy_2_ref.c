#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AEnemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AEnemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AEnemy_2\n"
"UnitDef_Ch16AEnemy_2:\n"
"\t.4byte 0x2500358D\n"
"\t.4byte 0x000006C0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00006D17\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x1D00358D\n"
"\t.4byte 0x010006C0\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0x78\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x1D00358D\n"
"\t.4byte 0x010006C0\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0x80\n"
"\t.4byte 0x00000020\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x7D00058D\n"
"\t.4byte 0x010006C0\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0x88\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
