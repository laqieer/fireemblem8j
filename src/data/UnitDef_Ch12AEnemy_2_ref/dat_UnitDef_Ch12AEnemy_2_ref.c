#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch12AEnemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch12AEnemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch12AEnemy_2\n"
"UnitDef_Ch12AEnemy_2:\n"
"\t.4byte 0x4D0063BB\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x70\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D0063BB\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x78\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D0063BB\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x80\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x550063BB\n"
"\t.4byte 0x01000000\n"
"\t.4byte frontier_df4_banim_b_078_90E58C + 0x88\n"
"\t.4byte 0x00001C14\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
