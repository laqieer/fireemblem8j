	.section .rodata.dat_Ch4MapChanges_ref, "a", %progbits
@ Ch4MapChanges: region-different data, JP 0x08a9b1d8 read from funcmap-aligned code literal (US 0x08a1e2ac); incbin baserom.gba
	.global Ch4MapChanges
Ch4MapChanges:
	.incbin "baserom.gba", 0xA9B1D8, 0x54
