	.section .rodata.dat_ProcScr_Popup_ref, "a", %progbits
@ ProcScr_Popup: region-different data, JP 0x085b9fac read from funcmap-aligned code literal (US 0x085921c8); incbin baserom.gba
	.global ProcScr_Popup
ProcScr_Popup:
	.incbin "baserom.gba", 0x5B9FAC, 0x60
