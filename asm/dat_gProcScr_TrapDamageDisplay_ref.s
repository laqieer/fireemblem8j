	.section .rodata.dat_gProcScr_TrapDamageDisplay_ref, "a", %progbits
@ gProcScr_TrapDamageDisplay: region-different data, JP 0x085c69b8 read from funcmap-aligned code literal (US 0x0859e490); incbin baserom.gba
	.global gProcScr_TrapDamageDisplay
gProcScr_TrapDamageDisplay:
	.incbin "baserom.gba", 0x5C69B8, 0x68
