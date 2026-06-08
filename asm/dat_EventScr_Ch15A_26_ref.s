	.section .rodata.dat_EventScr_Ch15A_26_ref, "a", %progbits
@ EventScr_Ch15A_26: region-different data, JP 0x08a68588 read from funcmap-aligned code literal (US 0x089f6484); incbin baserom.gba
	.global EventScr_Ch15A_26
EventScr_Ch15A_26:
	.incbin "baserom.gba", 0xA68588, 0x144
