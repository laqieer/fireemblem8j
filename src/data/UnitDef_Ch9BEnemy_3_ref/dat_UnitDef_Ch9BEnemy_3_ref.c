#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch9BEnemy_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch9BEnemy_3_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch9BEnemy_3\n"
"UnitDef_Ch9BEnemy_3:\n"
"\t.4byte 0x4D000580\n"
"\t.4byte 0x01000518\n"
"\t.4byte frontier_df3_unitdef_b_025_9163BC + 0x30C\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x4D000580\n"
"\t.4byte 0x01000518\n"
"\t.4byte frontier_df3_unitdef_b_025_9163BC + 0x314\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x4D000580\n"
"\t.4byte 0x01000518\n"
"\t.4byte frontier_df3_unitdef_b_025_9163BC + 0x31C\n"
"\t.4byte 0x0000001C\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
