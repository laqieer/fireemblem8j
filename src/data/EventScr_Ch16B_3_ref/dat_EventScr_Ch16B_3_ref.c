#include "global.h"

/* De-pointered from data/residual/EventScr_Ch16B_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch16B_3_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch16B_3\n"
"EventScr_Ch16B_3:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch16BEnemy_2\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_039_91BED4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000F23\n"
"\t.4byte 0x000E0221\n"
"\t.4byte 0x00000F20\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x000E0229\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
