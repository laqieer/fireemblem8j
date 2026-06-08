	.section .rodata.dat_EventScr_Ch6_0_ref, "a", %progbits
@ EventScr_Ch6_0: region-different data, JP 0x08a64a74 read from funcmap-aligned code literal (US 0x089f2940); incbin baserom.gba
	.global EventScr_Ch6_0
EventScr_Ch6_0:
	.incbin "baserom.gba", 0xA64A74, 0xBC
