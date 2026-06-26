#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch15AAlly_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch15AAlly_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch15AAlly_1\n"
"UnitDef_Ch15AAlly_1:\n"
"\t.4byte 0x51002D1F\n"
"\t.4byte 0x010004C0\n"
"\t.4byte frontier_df3_unitdef_b_005_9109A8 + 0x118\n"
"\t.4byte 0x006C4745\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x5000010F\n"
"\t.4byte 0x01000500\n"
"\t.4byte frontier_df3_unitdef_b_005_9109A8 + 0x120\n"
"\t.4byte 0x006D1678\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x5100351D\n"
"\t.4byte 0x01000540\n"
"\t.4byte frontier_df3_unitdef_b_005_9109A8 + 0x128\n"
"\t.4byte 0x006C1721\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
