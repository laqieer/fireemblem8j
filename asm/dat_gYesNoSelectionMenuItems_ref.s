	.section .rodata.dat_gYesNoSelectionMenuItems_ref, "a", %progbits
@ gYesNoSelectionMenuItems: region-different data, JP 0x085c4a28 read from funcmap-aligned code literal (US 0x0859c548); incbin baserom.gba
	.global gYesNoSelectionMenuItems
gYesNoSelectionMenuItems:
	.incbin "baserom.gba", 0x5C4A28, 0x6C
