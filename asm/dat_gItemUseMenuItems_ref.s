	.section .rodata.dat_gItemUseMenuItems_ref, "a", %progbits
@ gItemUseMenuItems: region-different data, JP 0x085c4680 read from funcmap-aligned code literal (US 0x0859c1a0); incbin baserom.gba
	.global gItemUseMenuItems
gItemUseMenuItems:
	.incbin "baserom.gba", 0x5C4680, 0xD8
