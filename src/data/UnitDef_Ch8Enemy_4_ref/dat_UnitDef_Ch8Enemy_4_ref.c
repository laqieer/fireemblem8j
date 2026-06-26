#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Enemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Enemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Enemy_4\n"
"UnitDef_Ch8Enemy_4:\n"
"\t.4byte 0x3D003F80\n"
"\t.4byte 0x01000447\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x39C\n"
"\t.4byte 0x00000020\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x3D002580\n"
"\t.4byte 0x000000C7\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x3D002580\n"
"\t.4byte 0x000000CD\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x45002D80\n"
"\t.4byte 0x00000080\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000045\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x3D000F80\n"
"\t.4byte 0x01000293\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x3A4\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
