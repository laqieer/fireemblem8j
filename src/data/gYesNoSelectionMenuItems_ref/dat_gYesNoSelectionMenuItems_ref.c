#include "global.h"

/* De-pointered from data/residual/gYesNoSelectionMenuItems.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gYesNoSelectionMenuItems_ref, \"a\", %progbits\n"
"\t.global gYesNoSelectionMenuItems\n"
"gYesNoSelectionMenuItems:\n"
"\t.4byte 0x080DCAA0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000007BB\n"
"\t.4byte 0x00003200\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte MenuCommand_SelectYes + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DCA98\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000007BC\n"
"\t.4byte 0x00003300\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte MenuCommand_SelectNo + 0x1\n"
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
