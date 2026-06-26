#include "global.h"

/* De-pointered from data/residual/EventScr_Ch10A_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch10A_8_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch10A_8\n"
"EventScr_Ch10A_8:\n"
"\t.4byte 0x00001927\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00001922\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x0A002620\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch10AEnemy_5\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000820\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch10AEnemy_3\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch10AEnemy_4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
