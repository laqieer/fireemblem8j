#include "global.h"

/* De-pointered from data/residual/gStealItemMenuItems.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gStealItemMenuItems_ref, \"a\", %progbits\n"
"\t.global gStealItemMenuItems\n"
"gStealItemMenuItems:\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00001F00\n"
"\t.4byte StealItemMenuCommand_Usability + 0x1\n"
"\t.4byte StealItemMenuCommand_Draw + 0x1\n"
"\t.4byte StealItemMenuCommand_Effect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002000\n"
"\t.4byte StealItemMenuCommand_Usability + 0x1\n"
"\t.4byte StealItemMenuCommand_Draw + 0x1\n"
"\t.4byte StealItemMenuCommand_Effect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002100\n"
"\t.4byte StealItemMenuCommand_Usability + 0x1\n"
"\t.4byte StealItemMenuCommand_Draw + 0x1\n"
"\t.4byte StealItemMenuCommand_Effect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002200\n"
"\t.4byte StealItemMenuCommand_Usability + 0x1\n"
"\t.4byte StealItemMenuCommand_Draw + 0x1\n"
"\t.4byte StealItemMenuCommand_Effect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002300\n"
"\t.4byte StealItemMenuCommand_Usability + 0x1\n"
"\t.4byte StealItemMenuCommand_Draw + 0x1\n"
"\t.4byte StealItemMenuCommand_Effect + 0x1\n"
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
