#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch12BEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch12BEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch12BEnemy_4\n"
"UnitDef_Ch12BEnemy_4:\n"
"\t.4byte 0x550063BB\n"
"\t.4byte 0x01000781\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x3B0\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550063BB\n"
"\t.4byte 0x01002783\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x3B8\n"
"\t.4byte 0x0000001B\n"
"\t.4byte 0x000C1200\n"
"\t.4byte 0x550063BB\n"
"\t.4byte 0x01000784\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x3C0\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000C1200\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
