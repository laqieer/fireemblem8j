#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1Tut_EirikaVisitHouseInit.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch1Tut_EirikaVisitHouseInit_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch1Tut_EirikaVisitHouseInit\n"
"EventScr_Ch1Tut_EirikaVisitHouseInit:\n"
"\t.4byte 0x00091220\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08EE1B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x060D3B24\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x08FE1B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00013B25\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020B41\n"
"\t.4byte EventScr_Ch1Tut_EirikaVisitHouseIdle1\n"
"\t.4byte 0x40003D20\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
