	.section .rodata.dat_EventScr_Ch9A_4_ref, "a", %progbits
@ EventScr_Ch9A_4: region-different data, JP 0x08a6614c read from funcmap-aligned code literal (US 0x089f4018); incbin baserom.gba
	.global EventScr_Ch9A_4
EventScr_Ch9A_4:
	.incbin "baserom.gba", 0xA6614C, 0x94
