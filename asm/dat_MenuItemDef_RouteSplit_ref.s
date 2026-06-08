	.section .rodata.dat_MenuItemDef_RouteSplit_ref, "a", %progbits
@ MenuItemDef_RouteSplit: region-different data, JP 0x08a65768 read from funcmap-aligned code literal (US 0x089f3634); incbin baserom.gba
	.global MenuItemDef_RouteSplit
MenuItemDef_RouteSplit:
	.incbin "baserom.gba", 0xA65768, 0x6C
