	.section .rodata.dat_Ch14EirikaMapChanges_ref, "a", %progbits
@ Ch14EirikaMapChanges: region-different data, JP 0x08a5b8d4 read from funcmap-aligned code literal (US 0x08a1e798); incbin baserom.gba
	.global Ch14EirikaMapChanges
Ch14EirikaMapChanges:
	.incbin "baserom.gba", 0xA5B8D4, 0x250
