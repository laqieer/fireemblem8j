#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_EndingScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Prologue_EndingScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Prologue_EndingScene\n"
"EventScr_Prologue_EndingScene:\n"
"\t.4byte 0x00311220\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000025\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xCC\n"
"\t.4byte 0x08D81B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00E00229\n"
"\t.4byte 0x00E10229\n"
"\t.4byte 0x00B70229\n"
"\t.4byte 0x00B40229\n"
"\t.4byte 0x00B50229\n"
"\t.4byte 0x00DC0229\n"
"\t.4byte 0x00B90229\n"
"\t.4byte 0x00C20229\n"
"\t.4byte 0x00C30229\n"
"\t.4byte 0x00E70229\n"
"\t.4byte 0x00C90229\n"
"\t.4byte 0x00012A22\n"
"\t.4byte 0x00000120\n"
);
