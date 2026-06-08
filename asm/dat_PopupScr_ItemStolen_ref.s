	.section .rodata.dat_PopupScr_ItemStolen_ref, "a", %progbits
@ PopupScr_ItemStolen: region-different data, JP 0x085ba174 read from funcmap-aligned code literal (US 0x085923d8); incbin baserom.gba
	.global PopupScr_ItemStolen
PopupScr_ItemStolen:
	.incbin "baserom.gba", 0x5BA174, 0x40
