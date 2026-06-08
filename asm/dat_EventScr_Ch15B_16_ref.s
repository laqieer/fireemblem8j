	.section .rodata.dat_EventScr_Ch15B_16_ref, "a", %progbits
@ EventScr_Ch15B_16: region-different data, JP 0x08a6ec20 read from funcmap-aligned code literal (US 0x089fcb64); incbin baserom.gba
	.global EventScr_Ch15B_16
EventScr_Ch15B_16:
	.incbin "baserom.gba", 0xA6EC20, 0x44
