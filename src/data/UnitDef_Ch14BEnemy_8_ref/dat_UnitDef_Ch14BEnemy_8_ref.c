#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch14BEnemy_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch14BEnemy_8_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch14BEnemy_8\n"
"UnitDef_Ch14BEnemy_8:\n"
"\t.4byte 0x75004580\n"
"\t.4byte 0x01000107\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x96C\n"
"\t.4byte 0x0000004E\n"
"\t.4byte 0x0008030E\n"
"\t.4byte 0x75002D80\n"
"\t.4byte 0x01000107\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x974\n"
"\t.4byte 0x00000046\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x75002D80\n"
"\t.4byte 0x01000107\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x97C\n"
"\t.4byte 0x00000046\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
