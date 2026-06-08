	.section .rodata.dat_EventScr_Ch13A_4_ref, "a", %progbits
@ EventScr_Ch13A_4: region-different data, JP 0x08a67bc4 read from funcmap-aligned code literal (US 0x089f5a90); incbin baserom.gba
	.global EventScr_Ch13A_4
EventScr_Ch13A_4:
	.incbin "baserom.gba", 0xA67BC4, 0x44
