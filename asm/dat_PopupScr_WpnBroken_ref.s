	.section .rodata.dat_PopupScr_WpnBroken_ref, "a", %progbits
@ PopupScr_WpnBroken: region-different data, JP 0x085ba1b4 read from funcmap-aligned code literal (US 0x08592420); incbin baserom.gba
	.global PopupScr_WpnBroken
PopupScr_WpnBroken:
	.incbin "baserom.gba", 0x5BA1B4, 0x40
