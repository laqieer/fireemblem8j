#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch20b_Turn.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch20b_Turn_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch20b_Turn\n"
"EventListScr_Ch20b_Turn:\n"
"\t.4byte 0x000D0002\n"
"\t.4byte 0x08A6FBAC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000B0002\n"
"\t.4byte EventScr_Ch20B_1\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte EventScr_Ch20B_2\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121304\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121312\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000005B\n"
"\t.4byte 0x00141215\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000088\n"
"\t.4byte 0x00141202\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch21b_EndingScene\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x000A000B\n"
);
