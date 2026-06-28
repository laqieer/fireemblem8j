#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1Tut_OnBeginning.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch1Tut_OnBeginning_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch1Tut_OnBeginning\n"
"EventScr_Ch1Tut_OnBeginning:\n"
"\t.4byte 0x00023B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x09031B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00B60229\n"
"\t.4byte 0x00D70229\n"
"\t.4byte 0x00001A20\n"
"\t.4byte battle_terrain_maruta1_tileset + 0x8\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00000120\n"
);
