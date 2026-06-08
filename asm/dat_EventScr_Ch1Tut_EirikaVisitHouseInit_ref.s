	.section .rodata.dat_EventScr_Ch1Tut_EirikaVisitHouseInit_ref, "a", %progbits
@ EventScr_Ch1Tut_EirikaVisitHouseInit: region-different data, JP 0x08a61d7c read from funcmap-aligned code literal (US 0x089efc44); incbin baserom.gba
	.global EventScr_Ch1Tut_EirikaVisitHouseInit
EventScr_Ch1Tut_EirikaVisitHouseInit:
	.incbin "baserom.gba", 0xA61D7C, 0x58
