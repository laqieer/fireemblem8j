#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AAlly_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AAlly_8_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AAlly_8\n"
"UnitDef_Ch16AAlly_8:\n"
"\t.4byte 0x08004F40\n"
"\t.4byte 0x010002C7\n"
"\t.4byte frontier_df3_unitdef_b_012_911C34 + 0x5C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08002B57\n"
"\t.4byte 0x000002C8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08003F80\n"
"\t.4byte 0x02000246\n"
"\t.4byte frontier_df3_unitdef_b_012_911C34 + 0x64\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08004E81\n"
"\t.4byte 0x02000249\n"
"\t.4byte frontier_df3_unitdef_b_012_911C34 + 0x74\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
