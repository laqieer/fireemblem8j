#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch12AEnemy_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch12AEnemy_5_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch12AEnemy_5\n"
"UnitDef_Ch12AEnemy_5:\n"
"\t.4byte 0x4D005BB3\n"
"\t.4byte 0x01000540\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x118\n"
"\t.4byte 0x000000B1\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D005BB3\n"
"\t.4byte 0x01000580\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x120\n"
"\t.4byte 0x000000B1\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D005BB3\n"
"\t.4byte 0x010005C0\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x128\n"
"\t.4byte 0x000000B1\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
