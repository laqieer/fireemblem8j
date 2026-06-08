	.section .rodata.dat_EventScr_Ch15A_0_ref, "a", %progbits
@ EventScr_Ch15A_0: region-different data, JP 0x08a6852c read from funcmap-aligned code literal (US 0x089f6404); incbin baserom.gba
	.global EventScr_Ch15A_0
EventScr_Ch15A_0:
	.incbin "baserom.gba", 0xA6852C, 0x48
