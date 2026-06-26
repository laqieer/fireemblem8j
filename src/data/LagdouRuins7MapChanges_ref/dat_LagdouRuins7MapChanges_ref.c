#include "global.h"

/* De-pointered from data/residual/LagdouRuins7MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_LagdouRuins7MapChanges_ref, \"a\", %progbits\n"
"\t.global LagdouRuins7MapChanges\n"
"LagdouRuins7MapChanges:\n"
"\t.4byte 0x08A5E088\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E0EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E0F0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E100\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E14C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E150\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E154\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5E158\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x6E4\n"
"\t.4byte 0x08A60027\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ruin7Ally\n"
"\t.4byte UnitDef_Ruin7Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A7086C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A708EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_37\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_38\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_39\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_40\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_41\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_42\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_43\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_44\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_45\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_46\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_47\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ruin_48\n"
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00080002\n"
"\t.4byte 0x08A70B4C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000A0002\n"
"\t.4byte 0x08A70BA0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A70BF4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte 0x08A70C54\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120510\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00120511\n"
"\t.4byte 0x00000005\n"
"\t.4byte gUidebug_2 + 0x112\n"
"\t.4byte 0x00140C04\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A70B10\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x08A70BD4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0D12080F\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A70C28\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0713000D\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x08A70C28\n"  /* coincidental const into fn: raw */
"\t.4byte 0x060C0007\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x08A70B2C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0E0B0B08\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x08A70B80\n"  /* coincidental const into fn: raw */
"\t.4byte 0x14130F0D\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
