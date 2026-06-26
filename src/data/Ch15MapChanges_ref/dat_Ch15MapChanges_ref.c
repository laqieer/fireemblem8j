#include "global.h"

/* De-pointered from data/residual/Ch15MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch15MapChanges_ref, \"a\", %progbits\n"
"\t.global Ch15MapChanges\n"
"Ch15MapChanges:\n"
"\t.4byte 0x08A5B924\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5B970\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BA34\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BA74\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BB14\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BB18\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BB1C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BB20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5FB34\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x08A5FFF5\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08910B70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08910B70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte data_08A6846C\n"
"\t.4byte EventScr_Ch15A_1\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6963C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000C\n"
"\t.4byte 0x000C0002\n"
"\t.4byte EventScr_Ch16A_9\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_001_A696D4\n"
"\t.4byte 0x00000F0D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0011030D\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x13880077\n"
"\t.4byte 0x00140514\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00140314\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000029\n"
"\t.4byte 0x00140C03\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120401\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120304\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120A03\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000061\n"
"\t.4byte 0x00140114\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A69654\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0B150002\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A69654\n"  /* coincidental const into fn: raw */
"\t.4byte 0x160D1201\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
