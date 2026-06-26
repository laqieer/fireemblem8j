#include "global.h"

/* De-pointered from data/residual/gDebugClearMenuItems.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gDebugClearMenuItems_ref, \"a\", %progbits\n"
"\t.global gDebugClearMenuItems\n"
"gDebugClearMenuItems:\n"
"\t.4byte 0x080DC9D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000063A\n"
"\t.4byte 0x00000300\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9C8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000063B\n"
"\t.4byte 0x00000400\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9B0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000063C\n"
"\t.4byte 0x00000500\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC998\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000063D\n"
"\t.4byte 0x00000600\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC980\n"  /* coincidental const into fn: raw */
"\t.4byte 0x0000063E\n"
"\t.4byte 0x00000704\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugClearMenu_ClearFile + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
