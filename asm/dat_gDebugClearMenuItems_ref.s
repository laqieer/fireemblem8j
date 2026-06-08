	.section .rodata.dat_gDebugClearMenuItems_ref, "a", %progbits
@ gDebugClearMenuItems: region-different data, JP 0x085c4320 read from funcmap-aligned code literal (US 0x0859be40); incbin baserom.gba
	.global gDebugClearMenuItems
gDebugClearMenuItems:
	.incbin "baserom.gba", 0x5C4320, 0xD8
