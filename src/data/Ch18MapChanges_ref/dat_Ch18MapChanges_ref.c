#include "global.h"

/* De-pointered from data/residual/Ch18MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch18MapChanges_ref, \"a\", %progbits\n"
"\t.global Ch18MapChanges\n"
"Ch18MapChanges:\n"
"\t.4byte 0x08A5BE28\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BE68\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BE6C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BE70\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BEBC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BEC0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BEC4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BEC8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5FB3C\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x08A5FFFD\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891350C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891350C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08913BB0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08913F5C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08914308\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08913C64\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08914010\n"  /* coincidental const into fn: raw */
"\t.4byte 0x089143BC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A69F20\n"  /* coincidental const into fn: raw */
"\t.4byte frontier_df3_eventscr_ch_002_A6A06C\n"
"\t.4byte 0x00030002\n"
"\t.4byte 0x08A6A75C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000002\n"
"\t.4byte frontier_df3_eventscr_ch_003_A6AA20\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AA38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000706\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AA50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000703\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AA84\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000804\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AAB8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000C08\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AAEC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000D09\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AB20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000903\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AB38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000802\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6A728\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000011\n"
"\t.4byte 0x00140B02\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000049\n"
"\t.4byte 0x00140B04\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000004F\n"
"\t.4byte 0x00140A1B\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x13880077\n"
"\t.4byte 0x00140C1B\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120F03\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F9D8\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x0018071A\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000005E\n"
"\t.4byte 0x00140C03\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x00140E1B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte 0x08A6A75C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
