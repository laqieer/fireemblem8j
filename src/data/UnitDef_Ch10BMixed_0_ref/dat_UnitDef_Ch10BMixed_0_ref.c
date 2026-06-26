#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch10BMixed_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch10BMixed_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch10BMixed_0\n"
"UnitDef_Ch10BMixed_0:\n"
"\t.4byte 0x5000010F\n"
"\t.4byte 0x00000405\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x50000702\n"
"\t.4byte 0x00000406\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x53004B19\n"
"\t.4byte 0x03000249\n"
"\t.4byte frontier_df3_unitdef_b_026_916D14 + 0x3E0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x5300431A\n"
"\t.4byte 0x02000209\n"
"\t.4byte frontier_df3_unitdef_b_026_916D14 + 0x3F8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x5300331C\n"
"\t.4byte 0x020001C9\n"
"\t.4byte frontier_df3_unitdef_b_026_916D14 + 0x408\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
