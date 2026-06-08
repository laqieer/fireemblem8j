	.section .rodata.dat_Ch20MapChanges_ref, "a", %progbits
@ Ch20MapChanges: region-different data, JP 0x08a5c150 read from funcmap-aligned code literal (US 0x08a1e9f0); incbin baserom.gba
	.global Ch20MapChanges
Ch20MapChanges:
	.incbin "baserom.gba", 0xA5C150, 0x10C
