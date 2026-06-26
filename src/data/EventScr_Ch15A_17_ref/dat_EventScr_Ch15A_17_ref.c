#include "global.h"

/* De-pointered from data/residual/EventScr_Ch15A_17.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch15A_17_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch15A_17\n"
"EventScr_Ch15A_17:\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7\n"
"\t.4byte 0xFFFF3328\n"
"\t.4byte 0x00C20620\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x0000000F\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_GiveTreasureToLuckyDog\n"
"\t.4byte 0x81AC0C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7 + 0x1C\n"
"\t.4byte 0x81AC0820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
