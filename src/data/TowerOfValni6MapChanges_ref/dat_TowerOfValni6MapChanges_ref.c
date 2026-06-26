#include "global.h"

/* De-pointered from data/residual/TowerOfValni6MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_TowerOfValni6MapChanges_ref, \"a\", %progbits\n"
"\t.global TowerOfValni6MapChanges\n"
"TowerOfValni6MapChanges:\n"
"\t.4byte 0x08A5D950\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D954\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D958\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D98C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D9A8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D9AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D9B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A5D9B4\n"  /* coincidental const into fn: raw */
"\t.4byte gUidebug_2 + 0x651\n"
"\t.4byte 0x08A6001E\n"  /* coincidental const into fn: raw */
"\t.4byte UnitDef_Tower6Ally\n"
"\t.4byte UnitDef_Tower6Ally\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08A6FFE8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x08A7005C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000C0002\n"
"\t.4byte 0x08A70228\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000D0002\n"
"\t.4byte 0x08A70240\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x000E0002\n"
"\t.4byte 0x08A70258\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000FF01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08A70120\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000006\n"
"\t.4byte 0x00070001\n"
"\t.4byte 0x08A70154\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080001\n"
"\t.4byte 0x08A7017C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00090001\n"
"\t.4byte 0x08A701A4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A0001\n"
"\t.4byte 0x08A701D0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B0001\n"
"\t.4byte 0x08A701FC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
);
