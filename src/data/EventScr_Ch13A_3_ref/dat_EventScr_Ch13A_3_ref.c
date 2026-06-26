#include "global.h"

/* De-pointered from data/residual/EventScr_Ch13A_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch13A_3_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch13A_3\n"
"EventScr_Ch13A_3:\n"
"\t.4byte 0x00141220\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch13AEnemy_3\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte data_0890F2E0\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x004F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x0A2F1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
