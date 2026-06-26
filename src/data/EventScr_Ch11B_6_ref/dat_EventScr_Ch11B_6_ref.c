#include "global.h"

/* De-pointered from data/residual/EventScr_Ch11B_6.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch11B_6_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch11B_6\n"
"EventScr_Ch11B_6:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch11BEnemy_4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0x78\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0xB4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_030_918784 + 0xF0\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
