	.section .rodata.dat_gUnitActionMenuItems_ref, "a", %progbits
@ gUnitActionMenuItems: region-different data, JP 0x085c4f14 read from funcmap-aligned code literal (US 0x0859ca34); incbin baserom.gba
	.global gUnitActionMenuItems
gUnitActionMenuItems:
	.incbin "baserom.gba", 0x5C4F14, 0x438
