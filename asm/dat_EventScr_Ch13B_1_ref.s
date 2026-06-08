	.section .rodata.dat_EventScr_Ch13B_1_ref, "a", %progbits
@ EventScr_Ch13B_1: region-different data, JP 0x08a6ddbc read from funcmap-aligned code literal (US 0x089fbcdc); incbin baserom.gba
	.global EventScr_Ch13B_1
EventScr_Ch13B_1:
	.incbin "baserom.gba", 0xA6DDBC, 0x50
