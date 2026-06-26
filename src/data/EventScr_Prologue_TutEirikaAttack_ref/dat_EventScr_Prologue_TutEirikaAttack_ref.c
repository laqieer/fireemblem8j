#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_TutEirikaAttack.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Prologue_TutEirikaAttack_ref, \"a\", %progbits\n"
"\t.global EventScr_Prologue_TutEirikaAttack\n"
"EventScr_Prologue_TutEirikaAttack:\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x08E31B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00013B25\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x000D0540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x00000721\n"
"\t.4byte 0x00003F42\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00020B41\n"
"\t.4byte EventScr_Prologue_TutorialA\n"
"\t.4byte 0x00000120\n"
);
