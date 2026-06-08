	.section .rodata.dat_EventScr_Ch12A_0_ref, "a", %progbits
@ EventScr_Ch12A_0: region-different data, JP 0x08a674a0 read from funcmap-aligned code literal (US 0x089f536c); incbin baserom.gba
	.global EventScr_Ch12A_0
EventScr_Ch12A_0:
	.incbin "baserom.gba", 0xA674A0, 0x40
