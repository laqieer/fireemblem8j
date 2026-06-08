	.section .rodata.dat_EventScr_Ch19A_11_ref, "a", %progbits
@ EventScr_Ch19A_11: region-different data, JP 0x08a6a76c read from funcmap-aligned code literal (US 0x089f8688); incbin baserom.gba
	.global EventScr_Ch19A_11
EventScr_Ch19A_11:
	.incbin "baserom.gba", 0xA6A76C, 0x2B4
