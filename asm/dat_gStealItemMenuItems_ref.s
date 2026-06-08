	.section .rodata.dat_gStealItemMenuItems_ref, "a", %progbits
@ gStealItemMenuItems: region-different data, JP 0x085c4758 read from funcmap-aligned code literal (US 0x0859c278); incbin baserom.gba
	.global gStealItemMenuItems
gStealItemMenuItems:
	.incbin "baserom.gba", 0x5C4758, 0xD8
