	.section .rodata.dat_gUnitLookup_ref, "a", %progbits
@ gUnitLookup: region-different data, JP 0x085c2a50 read from funcmap-aligned code literal (US 0x0859a5d0); incbin baserom.gba
	.global gUnitLookup
gUnitLookup:
	.incbin "baserom.gba", 0x5C2A50, 0x400
