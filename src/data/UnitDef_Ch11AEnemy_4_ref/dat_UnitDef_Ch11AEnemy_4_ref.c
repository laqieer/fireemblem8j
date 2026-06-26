#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch11AEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch11AEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch11AEnemy_4\n"
"UnitDef_Ch11AEnemy_4:\n"
"\t.4byte 0x550054AC\n"
"\t.4byte 0x01000440\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x1B0\n"
"\t.4byte 0x00000018\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550054AC\n"
"\t.4byte 0x01000440\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x1B8\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550055AD\n"
"\t.4byte 0x01000440\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x1C0\n"
"\t.4byte 0x0000002D\n"
"\t.4byte 0x000C0400\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
