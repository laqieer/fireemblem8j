#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Ally_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Ally_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Ally_0\n"
"UnitDef_Ch8Ally_0:\n"
"\t.4byte 0x3800010F\n"
"\t.4byte 0x01000540\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x324\n"
"\t.4byte 0x006D1678\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x48000510\n"
"\t.4byte 0x01000580\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x32C\n"
"\t.4byte 0x006C1C03\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x40000511\n"
"\t.4byte 0x01000580\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x334\n"
"\t.4byte 0x006C1603\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
