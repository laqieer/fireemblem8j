	.section .rodata.dat_EventScr_Ch15A_18_ref, "a", %progbits
@ EventScr_Ch15A_18: region-different data, JP 0x08a68900 read from funcmap-aligned code literal (US 0x089f6814); incbin baserom.gba
	.global EventScr_Ch15A_18
EventScr_Ch15A_18:
	.incbin "baserom.gba", 0xA68900, 0x44
