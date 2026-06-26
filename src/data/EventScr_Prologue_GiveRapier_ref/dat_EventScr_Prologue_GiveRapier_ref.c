#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_GiveRapier.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Prologue_GiveRapier_ref, \"a\", %progbits\n"
"\t.global EventScr_Prologue_GiveRapier\n"
"EventScr_Prologue_GiveRapier:\n"
"\t.4byte 0x00023B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08CF1B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000009\n"
"\t.4byte 0x00013720\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_08A618F0 + 0x70\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00000120\n"
);
