#include "global.h"

/* De-pointered from data/residual/LagdouRuins6MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_LagdouRuins6MapChanges_ref, \"a\", %progbits\n"
"\t.global LagdouRuins6MapChanges\n"
"LagdouRuins6MapChanges:\n"
"\t.4byte 0x08A5DFA0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DFF8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DFFC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E00C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E028\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E02C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E030\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E034\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x6E3\n"
"\t.4byte 0x08A60026\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ruin6Ally\n"
"\t.4byte UnitDef_Ruin6Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A7077C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A707F0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70918\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000403\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70930\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000504\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70948\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000605\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70960\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000604\n"
"\t.4byte 0x00080002\n"
"\t.4byte 0x08A70998\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000A0002\n"
"\t.4byte 0x08A709EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A70A40\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70A74\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A09\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x08A5F8DA\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00140B05\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A708EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x08A70978\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0C060A02\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A709CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x1518110E\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A709CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x19181615\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A70A20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x1914160D\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
