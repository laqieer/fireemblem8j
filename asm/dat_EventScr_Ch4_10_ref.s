	.section .rodata.dat_EventScr_Ch4_10_ref, "a", %progbits
@ EventScr_Ch4_10: region-different data, JP 0x08a63df8 read from funcmap-aligned code literal (US 0x089f1cc4); incbin baserom.gba
	.global EventScr_Ch4_10
EventScr_Ch4_10:
	.incbin "baserom.gba", 0xA63DF8, 0x64
