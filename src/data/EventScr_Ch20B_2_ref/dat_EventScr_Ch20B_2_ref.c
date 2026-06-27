#include "global.h"

/* De-pointered from data/residual/EventScr_Ch20B_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch20B_2_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch20B_2\n"
"EventScr_Ch20B_2:\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0891F914\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00010F23\n"
"\t.4byte 0x000C0221\n"
"\t.4byte 0x00010F20\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x000C0229\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7\n"
);
