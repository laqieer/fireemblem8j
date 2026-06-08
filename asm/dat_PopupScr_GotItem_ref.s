	.section .rodata.dat_PopupScr_GotItem_ref, "a", %progbits
@ PopupScr_GotItem: region-different data, JP 0x085ba014 read from funcmap-aligned code literal (US 0x08592230); incbin baserom.gba
	.global PopupScr_GotItem
PopupScr_GotItem:
	.incbin "baserom.gba", 0x5BA014, 0x40
