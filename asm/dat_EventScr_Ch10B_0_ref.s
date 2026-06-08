	.section .rodata.dat_EventScr_Ch10B_0_ref, "a", %progbits
@ EventScr_Ch10B_0: region-different data, JP 0x08a6cba4 read from funcmap-aligned code literal (US 0x089faac4); incbin baserom.gba
	.global EventScr_Ch10B_0
EventScr_Ch10B_0:
	.incbin "baserom.gba", 0xA6CBA4, 0xB8
