	.section .rodata.dat_PopupScr_ItemWasPilfered_ref, "a", %progbits
@ PopupScr_ItemWasPilfered: region-different data, JP 0x085ba054 read from funcmap-aligned code literal (US 0x08592288); incbin baserom.gba
	.global PopupScr_ItemWasPilfered
PopupScr_ItemWasPilfered:
	.incbin "baserom.gba", 0x5BA054, 0x48
