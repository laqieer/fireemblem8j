#include "global.h"

/* De-pointered from data/residual/Ch19MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_Ch19MapChanges_ref, \"a\", %progbits\n"
"\t.global Ch19MapChanges\n"
"Ch19MapChanges:\n"
"\t.4byte 0x08A5BF1C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BF98\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5BF9C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C000\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C01C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C020\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C024\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5C028\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x4CF\n"
"\t.4byte 0x08A5FFFE\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ch19AAlly_0\n"
"\t.4byte UnitDef_Ch19AAlly_0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6A3B8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A6A75C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AD44\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00800001\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AE80\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000150F\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6AEC4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001610\n"
"\t.4byte 0x000A0002\n"
"\t.4byte 0x08A6AF28\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A6AF7C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte 0x08A6B004\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00100002\n"
"\t.4byte 0x08A6B08C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6B144\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D13\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A6B1A8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000605\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00110B0B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A6AF08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0D190011\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A6AF5C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x06100007\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A6AFE4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x14100F07\n"
"\t.4byte 0x000F000B\n"
"\t.4byte 0x08A6B06C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0E100707\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
