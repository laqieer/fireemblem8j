#include "global.h"

/* De-pointered from data/residual/Ch20MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch20MapChanges_ref, \"a\", %progbits\n"
"\t.global Ch20MapChanges\n"
"Ch20MapChanges:\n"
"\t.4byte 0x08A5C07C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C0EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C0F0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C100\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C140\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C144\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C148\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C14C\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4D1\n"
"\t.4byte 0x08A60000\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891525C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891525C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6AB50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A6AD70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000D0002\n"
"\t.4byte 0x08A6B528\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000B0002\n"
"\t.4byte 0x08A6B480\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A6B4D4\n"  /* coincidental const into fn: raw */
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
"\t.4byte EventScr_Ch21A_0\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x000A000B\n"
"\t.4byte 0x08A6B508\n"  /* coincidental const into fn: raw */
"\t.4byte 0x060C050A\n"
"\t.4byte 0x0008000B\n"
"\t.4byte frontier_df3_eventscr_ch_005_A6B460\n"
"\t.4byte 0x0C0B0700\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A6B4B4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0C16070C\n"
"\t.4byte 0x000E000B\n"
"\t.4byte 0x08A6B55C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x04150001\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
