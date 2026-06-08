	.section .rodata.dat_EventScr_Ch15B_19_ref, "a", %progbits
@ EventScr_Ch15B_19: region-different data, JP 0x08a6ecec read from funcmap-aligned code literal (US 0x089fcc30); incbin baserom.gba
	.global EventScr_Ch15B_19
EventScr_Ch15B_19:
	.incbin "baserom.gba", 0xA6ECEC, 0x44
