#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch21AAlly_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch21AAlly_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch21AAlly_1\n"
"UnitDef_Ch21AAlly_1:\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x0100060C\n"
"\t.4byte frontier_df3_unitdef_b_023_91512C + 0xB90\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x0200060A\n"
"\t.4byte frontier_df3_unitdef_b_023_91512C + 0xB98\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08001B0B\n"
"\t.4byte 0x0100060C\n"
"\t.4byte frontier_df3_unitdef_b_023_91512C + 0xBA8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08004B19\n"
"\t.4byte 0x01000609\n"
"\t.4byte frontier_df3_unitdef_b_023_91512C + 0xBB0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08003C1E\n"
"\t.4byte 0x0100060B\n"
"\t.4byte frontier_df3_unitdef_b_023_91512C + 0xBB8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
