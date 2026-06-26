#include "global.h"

/* De-pointered from data/residual/MenuItemDef_WMNodeMenu.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_MenuItemDef_WMNodeMenu_ref, \"a\", %progbits\n"
"\t.global MenuItemDef_WMNodeMenu\n"
"MenuItemDef_WMNodeMenu:\n"
"\t.4byte 0x081F6524\n"  /* coincidental const into fn: raw */
"\t.4byte 0x06510600\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_IsArmoryAvailable + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnArmorySelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F6514\n"  /* coincidental const into fn: raw */
"\t.4byte 0x06520601\n"
"\t.4byte 0x00000100\n"
"\t.4byte WMMenu_IsVendorAvailable + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnVendorSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F6504\n"  /* coincidental const into fn: raw */
"\t.4byte 0x06530602\n"
"\t.4byte 0x00000200\n"
"\t.4byte WMMenu_IsSecretShopAvailable + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnSecretShopSelected + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x081F64F4\n"  /* coincidental const into fn: raw */
"\t.4byte 0x060A0603\n"
"\t.4byte 0x00000300\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMMenu_OnManageItemsSelected + 0x1\n"
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
