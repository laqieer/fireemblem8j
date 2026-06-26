#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch14AEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch14AEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch14AEnemy_4\n"
"UnitDef_Ch14AEnemy_4:\n"
"\t.4byte 0x6D000580\n"
"\t.4byte 0x01000698\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x9A8\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x6D000580\n"
"\t.4byte 0x01000698\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x9B0\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x65000580\n"
"\t.4byte 0x01000698\n"
"\t.4byte frontier_df3_unitdef_b_000_90F678 + 0x9B8\n"
"\t.4byte 0x0000001C\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
