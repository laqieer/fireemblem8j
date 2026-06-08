	.section .rodata.dat_Ch19MapChanges_ref, "a", %progbits
@ Ch19MapChanges: region-different data, JP 0x08a5c02c read from funcmap-aligned code literal (US 0x08a1e990); incbin baserom.gba
	.global Ch19MapChanges
Ch19MapChanges:
	.incbin "baserom.gba", 0xA5C02C, 0x124
