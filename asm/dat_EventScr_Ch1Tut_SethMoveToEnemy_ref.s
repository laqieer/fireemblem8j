	.section .rodata.dat_EventScr_Ch1Tut_SethMoveToEnemy_ref, "a", %progbits
@ EventScr_Ch1Tut_SethMoveToEnemy: region-different data, JP 0x08a62268 read from funcmap-aligned code literal (US 0x089f0130); incbin baserom.gba
	.global EventScr_Ch1Tut_SethMoveToEnemy
EventScr_Ch1Tut_SethMoveToEnemy:
	.incbin "baserom.gba", 0xA62268, 0x78
