#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1_EndingScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch1_EndingScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch1_EndingScene\n"
"EventScr_Ch1_EndingScene:\n"
"\t.4byte 0x00311220\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000039\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xCC\n"
"\t.4byte 0x00033322\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x08F71B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x08F81B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00BA0229\n"
"\t.4byte 0x00CF0229\n"
"\t.4byte 0x00CE0229\n"
"\t.4byte 0x00B60229\n"
"\t.4byte 0x00D70229\n"
"\t.4byte 0x00D60229\n"
"\t.4byte 0x00C70229\n"
"\t.4byte 0x00C80229\n"
"\t.4byte 0x00DD0229\n"
"\t.4byte 0x00023421\n"
"\t.4byte 0x00382A21\n"
"\t.4byte 0x00000120\n"
);
