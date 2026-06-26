#include "global.h"

/* De-pointered from data/residual/MenuItemDef_WMGeneralMenu.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MenuItemDef_WMGeneralMenu_ref, \"a\", %progbits\n"
"\t.global MenuItemDef_WMGeneralMenu\n"
"MenuItemDef_WMGeneralMenu:\n"
"\t.4byte 0x081F64EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x066205D7\n"
"\t.4byte 0x00000000\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnUnitSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F64E4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x066305D8\n"
"\t.4byte 0x00000100\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnStatusSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F64DC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x066805D9\n"
"\t.4byte 0x00000200\n"
"\t.4byte MapMenu_IsGuideCommandAvailable + 0x1\n"
"\t.4byte WMMenu_OnGuideDraw + 0x1\n"
"\t.4byte WMMenu_OnGuideSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F64D4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x066405DA\n"
"\t.4byte 0x00000300\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnOptionsSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F64CC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x063F05DB\n"
"\t.4byte 0x00000400\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnSaveSelected + 0x1\n"
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
