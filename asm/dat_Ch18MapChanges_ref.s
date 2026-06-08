	.section .rodata.dat_Ch18MapChanges_ref, "a", %progbits
@ Ch18MapChanges: region-different data, JP 0x08a5becc read from funcmap-aligned code literal (US 0x08a1e974); incbin baserom.gba
	.global Ch18MapChanges
Ch18MapChanges:
	.incbin "baserom.gba", 0xA5BECC, 0x160
