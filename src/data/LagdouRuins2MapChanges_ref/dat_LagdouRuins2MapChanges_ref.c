#include "global.h"

/* De-pointered from data/residual/LagdouRuins2MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_LagdouRuins2MapChanges_ref, \"a\", %progbits\n"
"\t.global LagdouRuins2MapChanges\n"
"LagdouRuins2MapChanges:\n"
"\t.4byte data_08A5DAE8 + 0x16C\n"
"\t.4byte data_08A5DAE8 + 0x170\n"
"\t.4byte data_08A5DAE8 + 0x174\n"
"\t.4byte data_08A5DAE8 + 0x178\n"
"\t.4byte data_08A5DAE8 + 0x1AC\n"
"\t.4byte data_08A5DAE8 + 0x1B0\n"
"\t.4byte data_08A5DAE8 + 0x1B4\n"
"\t.4byte data_08A5DAE8 + 0x1B8\n"
"\t.4byte gUidebug_2 + 0x661\n"
"\t.4byte 0x08A60022\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ruin2Ally\n"
"\t.4byte UnitDef_Ruin2Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A70400\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A70474\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7055C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000704\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70574\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A06\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7058C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A705A4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A705BC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000005\n"
"\t.4byte gUidebug_2 + 0xA8\n"
"\t.4byte 0x00140201\n"
"\t.4byte 0x00000005\n"
"\t.4byte gUidebug_2 + 0xB6\n"
"\t.4byte 0x00140F0F\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120609\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120811\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00121601\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120701\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120608\n"
"\t.4byte 0x00000007\n"
"\t.4byte 0x0BB80077\n"
"\t.4byte 0x00140311\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A70540\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
