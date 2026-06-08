	.section .rodata.dat_Ch16MapChanges_ref, "a", %progbits
@ Ch16MapChanges: region-different data, JP 0x08a5bc3c read from funcmap-aligned code literal (US 0x08a1e8b0); incbin baserom.gba
	.global Ch16MapChanges
Ch16MapChanges:
	.incbin "baserom.gba", 0xA5BC3C, 0x19C
