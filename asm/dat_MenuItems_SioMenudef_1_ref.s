	.section .rodata.dat_MenuItems_SioMenudef_1_ref, "a", %progbits
@ MenuItems_SioMenudef_1: region-different data, JP 0x085d4d00 read from funcmap-aligned code literal (US 0x085aac5c); incbin baserom.gba
	.global MenuItems_SioMenudef_1
MenuItems_SioMenudef_1:
	.incbin "baserom.gba", 0x5D4D00, 0xD8
