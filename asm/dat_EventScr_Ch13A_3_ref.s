	.section .rodata.dat_EventScr_Ch13A_3_ref, "a", %progbits
@ EventScr_Ch13A_3: region-different data, JP 0x08a67b7c read from funcmap-aligned code literal (US 0x089f5a48); incbin baserom.gba
	.global EventScr_Ch13A_3
EventScr_Ch13A_3:
	.incbin "baserom.gba", 0xA67B7C, 0x48
