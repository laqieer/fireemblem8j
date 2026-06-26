#include "global.h"

/* De-pointered from data/residual/LagdouRuins8MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_LagdouRuins8MapChanges_ref, \"a\", %progbits\n"
"\t.global LagdouRuins8MapChanges\n"
"LagdouRuins8MapChanges:\n"
"\t.4byte 0x08A5E1AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E270\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E274\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E29C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E2F4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E2F8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E2FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E300\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x6E5\n"
"\t.4byte 0x08A60028\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ruin8Ally\n"
"\t.4byte UnitDef_Ruin8Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A70A8C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A70B10\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00080002\n"
"\t.4byte 0x08A71340\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A712E0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A712FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0B110008\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x08A71320\n"  /* coincidental const into fn: raw */
"\t.4byte 0x05070000\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A712FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0B070600\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
