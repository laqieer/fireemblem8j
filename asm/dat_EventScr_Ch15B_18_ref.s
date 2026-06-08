	.section .rodata.dat_EventScr_Ch15B_18_ref, "a", %progbits
@ EventScr_Ch15B_18: region-different data, JP 0x08a6eca8 read from funcmap-aligned code literal (US 0x089fcbec); incbin baserom.gba
	.global EventScr_Ch15B_18
EventScr_Ch15B_18:
	.incbin "baserom.gba", 0xA6ECA8, 0x44
