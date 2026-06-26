#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch11BEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch11BEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch11BEnemy_4\n"
"UnitDef_Ch11BEnemy_4:\n"
"\t.4byte 0x1C00645E\n"
"\t.4byte 0x00002240\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000096\n"
"\t.4byte 0x000C1200\n"
"\t.4byte 0x4D0063BB\n"
"\t.4byte 0x01000200\n"
"\t.4byte frontier_df3_unitdef_b_028_9178F8 + 0x9A4\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D0063BB\n"
"\t.4byte 0x01000280\n"
"\t.4byte frontier_df3_unitdef_b_028_9178F8 + 0x9AC\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
