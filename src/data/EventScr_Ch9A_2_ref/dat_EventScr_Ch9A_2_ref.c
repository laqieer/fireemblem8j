#include "global.h"

/* De-pointered from data/residual/EventScr_Ch9A_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch9A_2_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch9A_2\n"
"EventScr_Ch9A_2:\n"
"\t.4byte 0x002A1420\n"
"\t.4byte 0x00210E20\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000009EA\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00021421\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000060\n"
"\t.4byte 0xFFFF3720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
