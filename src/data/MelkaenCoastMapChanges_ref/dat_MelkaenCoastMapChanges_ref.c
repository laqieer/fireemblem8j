#include "global.h"

/* De-pointered from data/residual/MelkaenCoastMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MelkaenCoastMapChanges_ref, \"a\", %progbits\n"
"\t.global MelkaenCoastMapChanges\n"
"MelkaenCoastMapChanges:\n"
"\t.4byte data_08A5E3B8 + 0x170\n"
"\t.4byte data_08A5E3B8 + 0x174\n"
"\t.4byte data_08A5E3B8 + 0x178\n"
"\t.4byte data_08A5E3B8 + 0x17C\n"
"\t.4byte data_08A5E3B8 + 0x198\n"
"\t.4byte data_08A5E3B8 + 0x19C\n"
"\t.4byte data_08A5E3B8 + 0x1A0\n"
"\t.4byte data_08A5E3B8 + 0x1A4\n"
"\t.4byte 0x08A5FFAF\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A600A4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924050\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924050\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924528\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924A00\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924ED8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x089245F0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924AC8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08924FA0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A714EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A71508\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000007\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000008\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000009\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000A\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000D\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000000F\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000010\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000011\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000012\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x08A7152C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000013\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
