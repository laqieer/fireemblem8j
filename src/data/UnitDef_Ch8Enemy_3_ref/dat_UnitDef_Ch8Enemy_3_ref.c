#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Enemy_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Enemy_3_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Enemy_3\n"
"UnitDef_Ch8Enemy_3:\n"
"\t.4byte 0x55000B4D\n"
"\t.4byte 0x010002D3\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x37C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x45004E80\n"
"\t.4byte 0x02000293\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x384\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x45004E80\n"
"\t.4byte 0x01000253\n"
"\t.4byte frontier_df4_banim_b_076_90B4DC + 0x394\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090300\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
