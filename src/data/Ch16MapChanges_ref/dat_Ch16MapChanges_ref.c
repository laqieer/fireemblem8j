#include "global.h"

/* De-pointered from data/residual/Ch16MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch16MapChanges_ref, \"a\", %progbits\n"
"\t.global Ch16MapChanges\n"
"Ch16MapChanges:\n"
"\t.4byte 0x08A5BB74\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BB9C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BBA0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BC04\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BC2C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BC30\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BC34\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BC38\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x365\n"
"\t.4byte 0x08A5FFF6\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08911390\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08911390\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte data_08A68B20\n"
"\t.4byte data_08A68F2C\n"
"\t.4byte 0x000E0002\n"
"\t.4byte 0x08A69E88\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000A\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E50\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000009\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A69E20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090003\n"
"\t.4byte 0x08A69DB8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00002122\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090003\n"
"\t.4byte 0x08A69D90\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000210B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090003\n"
"\t.4byte 0x08A69DE0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00002106\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F9A4\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00171401\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x08A5F9BE\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x0016020C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030001\n"
"\t.4byte 0x08A69AA8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A69E68\n"  /* coincidental const into fn: raw */
"\t.4byte 0x09160011\n"
"\t.4byte 0x000F000B\n"
"\t.4byte 0x08A69EBC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08100009\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000F000B\n"
"\t.4byte 0x08A69EBC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x10130A0F\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
