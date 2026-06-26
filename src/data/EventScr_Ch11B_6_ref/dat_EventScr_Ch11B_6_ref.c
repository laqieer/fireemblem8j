#include "global.h"

/* De-pointered from data/residual/EventScr_Ch11B_6.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch11B_6_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch11B_6\n"
"EventScr_Ch11B_6:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch11BEnemy_4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte 0x089187FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte 0x08918838\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00020540\n"
"\t.4byte 0x08918874\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
