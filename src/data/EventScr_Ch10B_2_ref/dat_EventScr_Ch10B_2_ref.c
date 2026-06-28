#include "global.h"

/* De-pointered from data/residual/EventScr_Ch10B_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch10B_2_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch10B_2\n"
"EventScr_Ch10B_2:\n"
"\t.4byte 0x000E3320\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x000E3325\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00141220\n"
"\t.4byte 0x000E2621\n"
"\t.4byte 0x000F0E20\n"
"\t.4byte 0x000E3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x0A7D1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00000120\n"
);
