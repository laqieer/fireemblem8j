#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_OneEnemyLeft.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Prologue_OneEnemyLeft_ref, \"a\", %progbits\n"
"\t.global EventScr_Prologue_OneEnemyLeft\n"
"EventScr_Prologue_OneEnemyLeft:\n"
"\t.4byte 0x00001924\n"
"\t.4byte 0x00070540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0007000C\n"
"\t.4byte 0x00023B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte banim_pekf_sp1_sheet_0 + 0x98\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00080221\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00001929\n"
"\t.4byte 0x00C20620\n"
"\t.4byte 0xFFFF0221\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
