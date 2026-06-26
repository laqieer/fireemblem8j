#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_Ch5xAlly.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_Ch5xAlly_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_Ch5xAlly\n"
"UnitDef_Event_Ch5xAlly:\n"
"\t.4byte 0x2000010F\n"
"\t.4byte 0x01000481\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x1CC\n"
"\t.4byte 0x006D1678\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x30000510\n"
"\t.4byte 0x01000483\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x1D4\n"
"\t.4byte 0x006C1C03\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x28000511\n"
"\t.4byte 0x01000480\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x1DC\n"
"\t.4byte 0x006C1601\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x18000742\n"
"\t.4byte 0x01000480\n"
"\t.4byte frontier_df4_banim_b_074_909DE8 + 0x1E4\n"
"\t.4byte 0x006C1604\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
