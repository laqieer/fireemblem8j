#include "global.h"

/* De-pointered from data/residual/EventScr_Ch6_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch6_2_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch6_2\n"
"EventScr_Ch6_2:\n"
"\t.4byte 0x00002220\n"
"\t.4byte 0x08072628\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x00111220\n"
"\t.4byte 0x00013B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000022\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xCC\n"
"\t.4byte 0x09AA1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00093322\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x09AB1B21\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x09B51B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00D40229\n"
"\t.4byte 0x00000120\n"
);
