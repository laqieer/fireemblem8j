	.section .rodata.dat_EventScr_Ch15A_22_ref, "a", %progbits
@ EventScr_Ch15A_22: region-different data, JP 0x08a68a10 read from funcmap-aligned code literal (US 0x089f6924); incbin baserom.gba
	.global EventScr_Ch15A_22
EventScr_Ch15A_22:
	.incbin "baserom.gba", 0xA68A10, 0x44
