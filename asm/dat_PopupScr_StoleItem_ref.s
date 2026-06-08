	.section .rodata.dat_PopupScr_StoleItem_ref, "a", %progbits
@ PopupScr_StoleItem: region-different data, JP 0x085ba134 read from funcmap-aligned code literal (US 0x08592380); incbin baserom.gba
	.global PopupScr_StoleItem
PopupScr_StoleItem:
	.incbin "baserom.gba", 0x5BA134, 0x40
