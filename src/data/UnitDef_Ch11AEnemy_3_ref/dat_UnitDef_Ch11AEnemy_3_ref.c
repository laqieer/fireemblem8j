#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch11AEnemy_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch11AEnemy_3_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch11AEnemy_3\n"
"UnitDef_Ch11AEnemy_3:\n"
"\t.4byte 0x550055AD\n"
"\t.4byte 0x01000015\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x198\n"
"\t.4byte 0x0000002D\n"
"\t.4byte 0x000C0400\n"
"\t.4byte 0x4D0054AC\n"
"\t.4byte 0x01000015\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x1A0\n"
"\t.4byte 0x00000018\n"
"\t.4byte 0x000C0400\n"
"\t.4byte 0x550054AC\n"
"\t.4byte 0x01000015\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x1A8\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
