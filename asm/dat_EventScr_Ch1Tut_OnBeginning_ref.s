	.section .rodata.dat_EventScr_Ch1Tut_OnBeginning_ref, "a", %progbits
@ EventScr_Ch1Tut_OnBeginning: region-different data, JP 0x08a61f20 read from funcmap-aligned code literal (US 0x089efde8); incbin baserom.gba
	.global EventScr_Ch1Tut_OnBeginning
EventScr_Ch1Tut_OnBeginning:
	.incbin "data/residual/EventScr_Ch1Tut_OnBeginning.bin"
