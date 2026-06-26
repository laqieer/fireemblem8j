#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch19AAlly_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch19AAlly_5_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch19AAlly_5\n"
"UnitDef_Ch19AAlly_5:\n"
"\t.4byte 0x08004B19\n"
"\t.4byte 0x01000207\n"
"\t.4byte frontier_df3_unitdef_b_022_915038 + 0x8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x01000246\n"
"\t.4byte frontier_df3_unitdef_b_022_915038 + 0x10\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x01000248\n"
"\t.4byte frontier_df3_unitdef_b_022_915038 + 0x18\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08003C1E\n"
"\t.4byte 0x01000246\n"
"\t.4byte frontier_df3_unitdef_b_022_915038 + 0x20\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08001B0B\n"
"\t.4byte 0x01000248\n"
"\t.4byte frontier_df3_unitdef_b_022_915038 + 0x28\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
