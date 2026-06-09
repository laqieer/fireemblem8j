	.section .rodata.dat_PopupScr_GotGold_ref, "a", %progbits
@ PopupScr_GotGold: region-different data, JP 0x085ba0c4 read from funcmap-aligned code literal (US 0x08592300); incbin baserom.gba
	.global PopupScr_GotGold
PopupScr_GotGold:
	.incbin "baserom.gba", 0x5BA0C4, 0x48
