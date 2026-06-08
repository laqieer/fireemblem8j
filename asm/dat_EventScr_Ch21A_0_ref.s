	.section .rodata.dat_EventScr_Ch21A_0_ref, "a", %progbits
@ EventScr_Ch21A_0: region-different data, JP 0x08a6b380 read from funcmap-aligned code literal (US 0x089f92a0); incbin baserom.gba
	.global EventScr_Ch21A_0
EventScr_Ch21A_0:
	.incbin "baserom.gba", 0xA6B380, 0x74
