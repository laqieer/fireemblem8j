#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch17b_Turn.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch17b_Turn_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch17b_Turn\n"
"EventListScr_Ch17b_Turn:\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6F324\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00080002\n"
"\t.4byte 0x08A6F368\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000A0002\n"
"\t.4byte 0x08A6F39C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A6F3D0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte 0x08A6F414\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte 0x08A6F124\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x08A6F34C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x1B16140E\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A6F3B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0A160010\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A6F380\n"  /* coincidental const into fn: raw */
"\t.4byte 0x13160E13\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A6F3F8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x080D0004\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte EventListScr_Ch17b_Turn\n"
"\t.4byte 0x08A5D17C\n"  /* coincidental const into fn: raw */
);
