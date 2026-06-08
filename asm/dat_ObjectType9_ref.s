	.section .rodata.dat_ObjectType9_ref, "a", %progbits
@ ObjectType9: region-different data, JP 0x0819d42c read from funcmap-aligned code literal (US 0x08169d54); incbin baserom.gba
	.global ObjectType9
ObjectType9:
	.incbin "baserom.gba", 0x19D42C, 0x140
