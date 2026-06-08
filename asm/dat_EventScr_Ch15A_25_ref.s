	.section .rodata.dat_EventScr_Ch15A_25_ref, "a", %progbits
@ EventScr_Ch15A_25: region-different data, JP 0x08a68adc read from funcmap-aligned code literal (US 0x089f69f0); incbin baserom.gba
	.global EventScr_Ch15A_25
EventScr_Ch15A_25:
	.incbin "baserom.gba", 0xA68ADC, 0x44
