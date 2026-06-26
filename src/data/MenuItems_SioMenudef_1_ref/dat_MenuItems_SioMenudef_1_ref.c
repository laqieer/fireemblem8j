#include "global.h"

/* De-pointered from data/residual/MenuItems_SioMenudef_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MenuItems_SioMenudef_1_ref, \"a\", %progbits\n"
"\t.global MenuItems_SioMenudef_1\n"
"MenuItems_SioMenudef_1:\n"
"\t.4byte 0x080DF2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte SioWeaponSelectMenu_Usability + 0x1\n"
"\t.4byte SioWeaponSelectMenu_Draw + 0x1\n"
"\t.4byte SioWeaponSelectMenu_OnSelect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DF2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000400\n"
"\t.4byte SioWeaponSelectMenu_Usability + 0x1\n"
"\t.4byte SioWeaponSelectMenu_Draw + 0x1\n"
"\t.4byte SioWeaponSelectMenu_OnSelect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DF2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000500\n"
"\t.4byte SioWeaponSelectMenu_Usability + 0x1\n"
"\t.4byte SioWeaponSelectMenu_Draw + 0x1\n"
"\t.4byte SioWeaponSelectMenu_OnSelect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DF2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000600\n"
"\t.4byte SioWeaponSelectMenu_Usability + 0x1\n"
"\t.4byte SioWeaponSelectMenu_Draw + 0x1\n"
"\t.4byte SioWeaponSelectMenu_OnSelect + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DF2DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000700\n"
"\t.4byte SioWeaponSelectMenu_Usability + 0x1\n"
"\t.4byte SioWeaponSelectMenu_Draw + 0x1\n"
"\t.4byte SioWeaponSelectMenu_OnSelect + 0x1\n"
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
