#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch14AEnemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch14AEnemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch14AEnemy_2\n"
"UnitDef_Ch14AEnemy_2:\n"
"\t.4byte 0x6D000980\n"
"\t.4byte 0x01002580\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x990\n"
"\t.4byte 0x00006A14\n"
"\t.4byte 0x20090300\n"
"\t.4byte 0x6D000980\n"
"\t.4byte 0x01000540\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x998\n"
"\t.4byte 0x0000001E\n"
"\t.4byte 0x20090300\n"
"\t.4byte 0x6D000980\n"
"\t.4byte 0x01000580\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x9A0\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
