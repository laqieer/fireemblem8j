#include "global.h"

/* De-pointered from data/residual/EventScr_Ch11B_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch11B_2_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch11B_2\n"
"EventScr_Ch11B_2:\n"
"\t.4byte 0x00111220\n"
"\t.4byte 0x000F2621\n"
"\t.4byte 0x000F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0000000D\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A60420\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0A951B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00032720\n"
"\t.4byte 0x00002220\n"
"\t.4byte 0x0A0C2628\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x01004220\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x00200E20\n"
"\t.4byte 0x0000422F\n"
"\t.4byte 0x00012C40\n"
"\t.4byte frontier_df3_unitdef_b_029_9184F0\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00193B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x0A961B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
