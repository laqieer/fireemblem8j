#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch11AEnemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch11AEnemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch11AEnemy_2\n"
"UnitDef_Ch11AEnemy_2:\n"
"\t.4byte 0x550052AA\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x180\n"
"\t.4byte 0x000000AD\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550052AA\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x188\n"
"\t.4byte 0x000000AD\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550052AA\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_077_90DB94 + 0x190\n"
"\t.4byte 0x000000AD\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
