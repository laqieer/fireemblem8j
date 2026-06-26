#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch14BEnemy_9.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch14BEnemy_9_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch14BEnemy_9\n"
"UnitDef_Ch14BEnemy_9:\n"
"\t.4byte 0x75004580\n"
"\t.4byte 0x01000115\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x984\n"
"\t.4byte 0x0000004E\n"
"\t.4byte 0x0008030E\n"
"\t.4byte 0x75002580\n"
"\t.4byte 0x01000115\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x98C\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x75002580\n"
"\t.4byte 0x01000115\n"
"\t.4byte frontier_df3_unitdef_b_034_919A90 + 0x994\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
