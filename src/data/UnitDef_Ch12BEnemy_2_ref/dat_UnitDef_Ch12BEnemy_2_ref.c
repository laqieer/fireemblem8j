#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch12BEnemy_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch12BEnemy_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch12BEnemy_2\n"
"UnitDef_Ch12BEnemy_2:\n"
"\t.4byte 0x55005BB3\n"
"\t.4byte 0x01000009\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x388\n"
"\t.4byte 0x000000B1\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x55005BB3\n"
"\t.4byte 0x01000009\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x390\n"
"\t.4byte 0x000000B1\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x4D0054AC\n"
"\t.4byte 0x01000009\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x398\n"
"\t.4byte 0x00000018\n"
"\t.4byte 0x000C0300\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
