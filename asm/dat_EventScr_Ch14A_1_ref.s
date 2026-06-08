	.section .rodata.dat_EventScr_Ch14A_1_ref, "a", %progbits
@ EventScr_Ch14A_1: region-different data, JP 0x08a682ec read from funcmap-aligned code literal (US 0x089f61c4); incbin baserom.gba
	.global EventScr_Ch14A_1
EventScr_Ch14A_1:
	.incbin "baserom.gba", 0xA682EC, 0x74
