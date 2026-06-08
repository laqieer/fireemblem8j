	.section .rodata.dat_Ch12EirikaMapChanges_ref, "a", %progbits
@ Ch12EirikaMapChanges: region-different data, JP 0x08a5b60c read from funcmap-aligned code literal (US 0x08a1e5b8); incbin baserom.gba
	.global Ch12EirikaMapChanges
Ch12EirikaMapChanges:
	.incbin "baserom.gba", 0xA5B60C, 0x100
