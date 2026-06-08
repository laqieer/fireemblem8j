	.section .rodata.dat_EventScr_Ch4_2_ref, "a", %progbits
@ EventScr_Ch4_2: region-different data, JP 0x08a63c6c read from funcmap-aligned code literal (US 0x089f1b38); incbin baserom.gba
	.global EventScr_Ch4_2
EventScr_Ch4_2:
	.incbin "baserom.gba", 0xA63C6C, 0xA0
