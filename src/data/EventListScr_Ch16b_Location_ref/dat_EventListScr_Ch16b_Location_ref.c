#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch16b_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch16b_Location_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch16b_Location\n"
"EventListScr_Ch16b_Location:\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x2B2\n"
"\t.4byte 0x00171401\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x2CC\n"
"\t.4byte 0x0016020C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch16b_BeginningScene + 0x18\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A6F02C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x09160011\n"
"\t.4byte 0x000F000B\n"
"\t.4byte 0x08A6F080\n"  /* coincidental const into fn: raw */
"\t.4byte data_080ED67C + 0x1298D\n"
"\t.4byte 0x000F000B\n"
"\t.4byte 0x08A6F080\n"  /* coincidental const into fn: raw */
"\t.4byte 0x10130A0F\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
