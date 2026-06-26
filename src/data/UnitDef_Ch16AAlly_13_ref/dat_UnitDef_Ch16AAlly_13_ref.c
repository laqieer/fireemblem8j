#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch16AAlly_13.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch16AAlly_13_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch16AAlly_13\n"
"UnitDef_Ch16AAlly_13:\n"
"\t.4byte 0x0800010F\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0300000B\n"
"\t.4byte frontier_df3_unitdef_b_014_911FCC\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0300000B\n"
"\t.4byte 0x08911FE4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0400000B\n"
"\t.4byte 0x08911FFC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
