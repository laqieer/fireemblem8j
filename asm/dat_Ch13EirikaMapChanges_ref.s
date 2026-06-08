	.section .rodata.dat_Ch13EirikaMapChanges_ref, "a", %progbits
@ Ch13EirikaMapChanges: region-different data, JP 0x08a5b70c read from funcmap-aligned code literal (US 0x08a1e5f4); incbin baserom.gba
	.global Ch13EirikaMapChanges
Ch13EirikaMapChanges:
	.incbin "baserom.gba", 0xA5B70C, 0x1C8
