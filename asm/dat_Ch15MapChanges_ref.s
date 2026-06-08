	.section .rodata.dat_Ch15MapChanges_ref, "a", %progbits
@ Ch15MapChanges: region-different data, JP 0x08a5bb24 read from funcmap-aligned code literal (US 0x08a1e860); incbin baserom.gba
	.global Ch15MapChanges
Ch15MapChanges:
	.incbin "baserom.gba", 0xA5BB24, 0x118
