#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_PrologueEscapees.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_PrologueEscapees_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_PrologueEscapees\n"
"UnitDef_Event_PrologueEscapees:\n"
"\t.4byte 0x08000702\n"  /* coincidental const into fn: raw */
"\t.4byte 0x020000C9\n"
"\t.4byte REDA_PrologueEscapees0\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000504\n"  /* coincidental const into fn: raw */
"\t.4byte 0x020000C9\n"
"\t.4byte REDA_PrologueEscapees2\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000146\n"
"\t.4byte REDA_PrologueEscapees4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
