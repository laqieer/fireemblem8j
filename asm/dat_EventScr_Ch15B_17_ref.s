	.section .rodata.dat_EventScr_Ch15B_17_ref, "a", %progbits
@ EventScr_Ch15B_17: region-different data, JP 0x08a6ec64 read from funcmap-aligned code literal (US 0x089fcba8); incbin baserom.gba
	.global EventScr_Ch15B_17
EventScr_Ch15B_17:
	.incbin "baserom.gba", 0xA6EC64, 0x44
