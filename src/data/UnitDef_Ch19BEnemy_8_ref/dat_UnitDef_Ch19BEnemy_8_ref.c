#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch19BEnemy_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch19BEnemy_8_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch19BEnemy_8\n"
"UnitDef_Ch19BEnemy_8:\n"
"\t.4byte 0x7D0063BB\n"
"\t.4byte 0x0100009B\n"
"\t.4byte frontier_df3_unitdef_b_049_91E988 + 0xC0\n"
"\t.4byte 0x0000161C\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x7D0063BB\n"
"\t.4byte 0x0100009B\n"
"\t.4byte frontier_df3_unitdef_b_049_91E988 + 0xC8\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x7D0063BB\n"
"\t.4byte 0x0100009B\n"
"\t.4byte frontier_df3_unitdef_b_049_91E988 + 0xD0\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
