	.section .rodata.dat_TileAnimations2_ref, "a", %progbits
@ TileAnimations2: region-different data, JP 0x085c5a48 read from funcmap-aligned code literal (US 0x0859d568); incbin baserom.gba
	.global TileAnimations2
TileAnimations2:
	.incbin "baserom.gba", 0x5C5A48, 0x110
