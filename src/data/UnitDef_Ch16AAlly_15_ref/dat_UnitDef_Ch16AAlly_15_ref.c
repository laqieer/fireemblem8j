#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AAlly_15.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AAlly_15_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AAlly_15\n"
"UnitDef_Ch16AAlly_15:\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x03000247\n"
"\t.4byte frontier_df3_unitdef_b_015_91206C + 0x64\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x03000247\n"
"\t.4byte frontier_df3_unitdef_b_015_91206C + 0x7C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x03000247\n"
"\t.4byte frontier_df3_unitdef_b_015_91206C + 0x94\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
