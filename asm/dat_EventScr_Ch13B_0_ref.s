	.section .rodata.dat_EventScr_Ch13B_0_ref, "a", %progbits
@ EventScr_Ch13B_0: region-different data, JP 0x08a6dd6c read from funcmap-aligned code literal (US 0x089fbc8c); incbin baserom.gba
	.global EventScr_Ch13B_0
EventScr_Ch13B_0:
	.incbin "baserom.gba", 0xA6DD6C, 0x50
