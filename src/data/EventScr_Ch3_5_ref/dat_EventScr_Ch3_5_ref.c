#include "global.h"

/* De-pointered from data/residual/EventScr_Ch3_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch3_5_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch3_5\n"
"EventScr_Ch3_5:\n"
"\t.4byte 0x00083B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x094F1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00002F40\n"
"\t.4byte 0x09030008\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x000D0540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00090005\n"
"\t.4byte 0x00083F40\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x095F1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00000120\n"
);
