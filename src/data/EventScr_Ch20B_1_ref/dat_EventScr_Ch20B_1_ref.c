#include "global.h"

/* De-pointered from data/residual/EventScr_Ch20B_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch20B_1_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch20B_1\n"
"EventScr_Ch20B_1:\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_052_91F89C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00000F23\n"
"\t.4byte 0x000B0221\n"
"\t.4byte 0x00000F20\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x000B0229\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7\n"
);
