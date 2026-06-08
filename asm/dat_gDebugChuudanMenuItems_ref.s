	.section .rodata.dat_gDebugChuudanMenuItems_ref, "a", %progbits
@ gDebugChuudanMenuItems: region-different data, JP 0x085c43f8 read from funcmap-aligned code literal (US 0x0859c038); incbin baserom.gba
	.global gDebugChuudanMenuItems
gDebugChuudanMenuItems:
	.incbin "baserom.gba", 0x5C43F8, 0x48
