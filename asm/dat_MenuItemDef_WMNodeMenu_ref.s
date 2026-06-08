	.section .rodata.dat_MenuItemDef_WMNodeMenu_ref, "a", %progbits
@ MenuItemDef_WMNodeMenu: region-different data, JP 0x08ac1b0c read from funcmap-aligned code literal (US 0x08a3e14c); incbin baserom.gba
	.global MenuItemDef_WMNodeMenu
MenuItemDef_WMNodeMenu:
	.incbin "baserom.gba", 0xAC1B0C, 0xB4
