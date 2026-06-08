	.section .rodata.dat_MenuItemDef_WMGeneralMenu_ref, "a", %progbits
@ MenuItemDef_WMGeneralMenu: region-different data, JP 0x08ac1a0c read from funcmap-aligned code literal (US 0x08a3e04c); incbin baserom.gba
	.global MenuItemDef_WMGeneralMenu
MenuItemDef_WMGeneralMenu:
	.incbin "baserom.gba", 0xAC1A0C, 0xD8
