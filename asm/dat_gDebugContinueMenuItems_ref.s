	.section .rodata.dat_gDebugContinueMenuItems_ref, "a", %progbits
@ gDebugContinueMenuItems: region-different data, JP 0x085c4464 read from funcmap-aligned code literal (US 0x0859bf84); incbin baserom.gba
	.global gDebugContinueMenuItems
gDebugContinueMenuItems:
	.incbin "baserom.gba", 0x5C4464, 0xB4
