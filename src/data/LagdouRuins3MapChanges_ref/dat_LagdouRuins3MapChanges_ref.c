#include "global.h"

/* De-pointered from data/residual/LagdouRuins3MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_LagdouRuins3MapChanges_ref, \"a\", %progbits\n"
"\t.global LagdouRuins3MapChanges\n"
"LagdouRuins3MapChanges:\n"
"\t.4byte 0x08A5DCF4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DD34\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DD38\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DD9C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DDB8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DDBC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DDC0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5DDC4\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x662\n"
"\t.4byte 0x08A60023\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Ruin3Ally\n"
"\t.4byte UnitDef_Ruin3Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A704CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A70540\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70648\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A70660\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000908\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000005\n"
"\t.4byte gUidebug_2 + 0xC6\n"
"\t.4byte 0x00140212\n"
"\t.4byte 0x00000005\n"
"\t.4byte gUidebug_2 + 0xD0\n"
"\t.4byte 0x00141A01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A70678\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
);
