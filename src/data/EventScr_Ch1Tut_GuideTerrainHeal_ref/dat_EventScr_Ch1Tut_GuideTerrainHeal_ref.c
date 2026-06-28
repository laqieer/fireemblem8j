#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1Tut_GuideTerrainHeal.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch1Tut_GuideTerrainHeal_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch1Tut_GuideTerrainHeal\n"
"EventScr_Ch1Tut_GuideTerrainHeal:\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x07073B24\n"
"\t.4byte 0x02073B24\n"
"\t.4byte 0x02023B24\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x09021B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00CE0229\n"
"\t.4byte 0x02003D20\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
