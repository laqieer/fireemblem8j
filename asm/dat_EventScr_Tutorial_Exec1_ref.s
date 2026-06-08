	.section .rodata.dat_EventScr_Tutorial_Exec1_ref, "a", %progbits
@ EventScr_Tutorial_Exec1: region-different data, JP 0x08a608cc read from funcmap-aligned code literal (US 0x089ee794); incbin baserom.gba
	.global EventScr_Tutorial_Exec1
EventScr_Tutorial_Exec1:
	.incbin "baserom.gba", 0xA608CC, 0x94
