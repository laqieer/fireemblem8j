#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch5xAlly_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch5xAlly_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch5xAlly_0\n"
"UnitDef_Ch5xAlly_0:\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x0000020C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000511\n"
"\t.4byte 0x0000020E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000510\n"
"\t.4byte 0x020000C8\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x1F4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
