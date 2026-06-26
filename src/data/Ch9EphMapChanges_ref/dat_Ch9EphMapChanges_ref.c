#include "global.h"

/* De-pointered from data/residual/Ch9EphMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch9EphMapChanges_ref, \"a\", %progbits\n"
"\t.global Ch9EphMapChanges\n"
"Ch9EphMapChanges:\n"
"\t.4byte 0x08A5C334\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C368\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C3AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C41C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C45C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C460\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C464\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C468\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4D5\n"
"\t.4byte 0x08A60004\n"  /* coincidental const into fn: raw */
"\t.4byte 0x089167B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x089167B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6C218\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A6C5C0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00030002\n"
"\t.4byte frontier_df3_eventscr_ch_008_A6CD00\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D0FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000803\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D114\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6D13C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch10B_0\n"
"\t.4byte 0x00800001\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch10B_1\n"
"\t.4byte 0x00800002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00070003\n"
"\t.4byte 0x08A6CFBC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D0F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A6CFE4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000E1D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080003\n"
"\t.4byte 0x08A6D00C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000E22\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A0006\n"
"\t.4byte 0x08A6D034\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100209\n"
"\t.4byte 0x000A0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200109\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F9FA\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00160E09\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5FA12\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00170E08\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A6D0D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100105\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A6D0AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100006\n"
"\t.4byte 0x000B0006\n"
"\t.4byte 0x08A6D070\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100C04\n"
"\t.4byte 0x000B0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200B04\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte frontier_df3_eventscr_ch_008_A6CD00\n"
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
