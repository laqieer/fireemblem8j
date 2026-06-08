	.section .rodata.dat_Ch9EphMapChanges_ref, "a", %progbits
@ Ch9EphMapChanges: region-different data, JP 0x08a5c46c read from funcmap-aligned code literal (US 0x08a1ea6c); incbin baserom.gba
	.global Ch9EphMapChanges
Ch9EphMapChanges:
	.incbin "baserom.gba", 0xA5C46C, 0x160
