	.section .rodata.dat_Ch5MapChanges_ref, "a", %progbits
@ Ch5MapChanges: region-different data, JP 0x08a9b264 read from funcmap-aligned code literal (US 0x08a1e338); incbin baserom.gba
	.global Ch5MapChanges
Ch5MapChanges:
	.incbin "baserom.gba", 0xA9B264, 0x6C
