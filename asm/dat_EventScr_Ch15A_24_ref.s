	.section .rodata.dat_EventScr_Ch15A_24_ref, "a", %progbits
@ EventScr_Ch15A_24: region-different data, JP 0x08a68a98 read from funcmap-aligned code literal (US 0x089f69ac); incbin baserom.gba
	.global EventScr_Ch15A_24
EventScr_Ch15A_24:
	.incbin "baserom.gba", 0xA68A98, 0x44
