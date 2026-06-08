	.section .rodata.dat_EventScr_Ch5_0_ref, "a", %progbits
@ EventScr_Ch5_0: region-different data, JP 0x08a642a4 read from funcmap-aligned code literal (US 0x089f2170); incbin baserom.gba
	.global EventScr_Ch5_0
EventScr_Ch5_0:
	.incbin "baserom.gba", 0xA642A4, 0x4C
