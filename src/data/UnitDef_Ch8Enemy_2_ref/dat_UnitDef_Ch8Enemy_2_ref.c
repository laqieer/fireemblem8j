#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Enemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Enemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Enemy_2\n"
"UnitDef_Ch8Enemy_2:\n"
"\t.4byte 0x45000580\n"
"\t.4byte 0x01000540\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x34C\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x45000580\n"
"\t.4byte 0x01000580\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x354\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x45000580\n"
"\t.4byte 0x010005C0\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x35C\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
