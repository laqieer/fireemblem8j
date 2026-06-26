#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_PrologueEnemy.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_PrologueEnemy_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_PrologueEnemy\n"
"UnitDef_Event_PrologueEnemy:\n"
"\t.4byte 0x24003F68\n"
"\t.4byte 0x0100020E\n"
"\t.4byte frontier_df4_banim_b_073_907F78 + 0x20C\n"
"\t.4byte 0x0000001F\n"
"\t.4byte 0x00000306\n"
"\t.4byte 0x0C003F82\n"
"\t.4byte 0x010001CE\n"
"\t.4byte frontier_df4_banim_b_073_907F78 + 0x214\n"
"\t.4byte 0x0000001F\n"
"\t.4byte 0x00000A00\n"
"\t.4byte 0x14003F80\n"
"\t.4byte 0x010001CE\n"
"\t.4byte frontier_df4_banim_b_073_907F78 + 0x21C\n"
"\t.4byte 0x0000001F\n"
"\t.4byte 0x00021200\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
