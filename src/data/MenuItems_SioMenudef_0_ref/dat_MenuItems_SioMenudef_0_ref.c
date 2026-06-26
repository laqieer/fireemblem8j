#include "global.h"

/* De-pointered from data/residual/MenuItems_SioMenudef_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MenuItems_SioMenudef_0_ref, \"a\", %progbits\n"
"\t.global MenuItems_SioMenudef_0\n"
"MenuItems_SioMenudef_0:\n"
"\t.4byte data_080DF228 + 0xA8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000100\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte SioAttackTypeMenu_OnSelect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte data_080DF228 + 0x9C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000200\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte SioAttackTypeMenu_OnSelect + 0x1\n"
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
