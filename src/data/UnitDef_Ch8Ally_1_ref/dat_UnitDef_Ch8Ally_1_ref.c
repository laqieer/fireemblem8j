#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Ally_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Ally_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Ally_1\n"
"UnitDef_Ch8Ally_1:\n"
"\t.4byte 0x08000742\n"
"\t.4byte 0x01000593\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x364\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x40000201\n"
"\t.4byte 0x010005D3\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x36C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x010005D4\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x374\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
