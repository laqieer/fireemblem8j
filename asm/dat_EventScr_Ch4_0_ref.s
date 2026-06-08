	.section .rodata.dat_EventScr_Ch4_0_ref, "a", %progbits
@ EventScr_Ch4_0: region-different data, JP 0x08a63ad0 read from funcmap-aligned code literal (US 0x089f199c); incbin baserom.gba
	.global EventScr_Ch4_0
EventScr_Ch4_0:
	.incbin "baserom.gba", 0xA63AD0, 0x5C
