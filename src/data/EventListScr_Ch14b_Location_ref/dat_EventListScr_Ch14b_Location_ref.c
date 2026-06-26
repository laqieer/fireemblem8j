#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch14b_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch14b_Location_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch14b_Location\n"
"EventListScr_Ch14b_Location:\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x08A6E9C0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100E01\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200D01\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5FA64\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00170408\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A6E9FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100611\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A6EA24\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100D05\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte EventScr_Ch14b_EndingScene\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x0014000B\n"
"\t.4byte EventScr_Ch15B_16\n"
"\t.4byte 0x0A170714\n"
"\t.4byte 0x0015000B\n"
"\t.4byte EventScr_Ch15B_17\n"
"\t.4byte 0x02020000\n"
"\t.4byte 0x0018000B\n"
"\t.4byte EventScr_Ch15B_20\n"
"\t.4byte 0x02160012\n"
"\t.4byte 0x0017000B\n"
"\t.4byte EventScr_Ch15B_19\n"
"\t.4byte 0x0B010900\n"
"\t.4byte 0x0012000B\n"
"\t.4byte EventScr_Ch15B_14\n"
"\t.4byte 0x0C090905\n"
"\t.4byte 0x001A000B\n"
"\t.4byte EventScr_Ch15B_21\n"
"\t.4byte 0x0F0A0E08\n"
"\t.4byte 0x0013000B\n"
"\t.4byte EventScr_Ch15B_15\n"
"\t.4byte 0x0D120B0E\n"
"\t.4byte 0x0016000B\n"
"\t.4byte EventScr_Ch15B_18\n"
"\t.4byte 0x15170F16\n"
"\t.4byte 0x0019000B\n"
"\t.4byte 0x08A6EB68\n"  /* coincidental const into fn: raw */
"\t.4byte 0x150E110B\n"
"\t.4byte 0x0019000B\n"
"\t.4byte 0x08A6EB68\n"  /* coincidental const into fn: raw */
"\t.4byte 0x15150E0F\n"
"\t.4byte 0x001B000B\n"
"\t.4byte EventScr_Ch15B_22\n"
"\t.4byte 0x07000400\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A5CC40\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5CC80\n"  /* coincidental const into fn: raw */
"\t.4byte EventListScr_Ch14b_Location\n"
"\t.4byte 0x08A5CD64\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5CE04\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5CE08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5CE0C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5CE10\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5FCB2\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x08A60011\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891B2CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0891B2CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte EventScr_Ch14b_BeginningScene\n"
"\t.4byte EventScr_Ch14b_EndingScene\n"
"\t.4byte 0x000D0002\n"
"\t.4byte EventScr_Ch16B_5\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte EventScr_Ch16B_3\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6EE7C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000010\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6EE64\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
