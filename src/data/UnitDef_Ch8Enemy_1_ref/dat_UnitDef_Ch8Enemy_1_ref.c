#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Enemy_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Enemy_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Enemy_1\n"
"UnitDef_Ch8Enemy_1:\n"
"\t.4byte 0x3D002580\n"
"\t.4byte 0x01000005\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x33C\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x3D002580\n"
"\t.4byte 0x0100000F\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x344\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x55000D80\n"
"\t.4byte 0x0000034A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00006B01\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
