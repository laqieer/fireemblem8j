#include "global.h"

/* De-pointered from data/residual/MenuItemDef_RouteSplit.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MenuItemDef_RouteSplit_ref, \"a\", %progbits\n"
"\t.global MenuItemDef_RouteSplit\n"
"MenuItemDef_RouteSplit:\n"
"\t.4byte 0x081F5310\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000BD5\n"
"\t.4byte 0x00000000\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte MenuCommand_DrawRouteSplit + 0x1\n"
"\t.4byte sub_8088830 + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F5310\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000BD6\n"
"\t.4byte 0x00000100\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte MenuCommand_DrawRouteSplit + 0x1\n"
"\t.4byte sub_808884C + 0x1\n"
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
