	.section .rodata.dat_EventScr_Ch1Tut_BeforeSethMoveToEnemy_ref, "a", %progbits
@ EventScr_Ch1Tut_BeforeSethMoveToEnemy: region-different data, JP 0x08a622e0 read from funcmap-aligned code literal (US 0x089f01a8); incbin baserom.gba
	.global EventScr_Ch1Tut_BeforeSethMoveToEnemy
EventScr_Ch1Tut_BeforeSethMoveToEnemy:
	.incbin "baserom.gba", 0xA622E0, 0x60
