/* De-pointered from data/residual/MenuItemDef_WMNodeMenu.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_MenuItemDef_WMNodeMenu_ref, "a", %progbits
	.global MenuItemDef_WMNodeMenu
MenuItemDef_WMNodeMenu:
	.4byte sGmapRouteMenuText + 0x64
	.4byte 0x06510600
	.4byte 0x00000000
	.4byte WMMenu_IsArmoryAvailable + 0x1
	.4byte 0x00000000
	.4byte WMMenu_OnArmorySelected + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte sGmapRouteMenuText + 0x54
	.4byte 0x06520601
	.4byte 0x00000100
	.4byte WMMenu_IsVendorAvailable + 0x1
	.4byte 0x00000000
	.4byte WMMenu_OnVendorSelected + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte sGmapRouteMenuText + 0x44
	.4byte 0x06530602
	.4byte 0x00000200
	.4byte WMMenu_IsSecretShopAvailable + 0x1
	.4byte 0x00000000
	.4byte WMMenu_OnSecretShopSelected + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte sGmapRouteMenuText + 0x34
	.4byte 0x060A0603
	.4byte 0x00000300
	.4byte MenuAlwaysEnabled + 0x1
	.4byte 0x00000000
	.4byte WMMenu_OnManageItemsSelected + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
