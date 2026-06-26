#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AMixed_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AMixed_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AMixed_1\n"
"UnitDef_Ch16AMixed_1:\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x03000207\n"
"\t.4byte frontier_df3_unitdef_b_013_911E38 + 0xBC\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x01000287\n"
"\t.4byte frontier_df3_unitdef_b_013_911E38 + 0xD4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x010002C8\n"
"\t.4byte frontier_df3_unitdef_b_013_911E38 + 0xDC\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0B0072FB\n"
"\t.4byte 0x02000004\n"
"\t.4byte frontier_df3_unitdef_b_013_911E38 + 0xE4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
