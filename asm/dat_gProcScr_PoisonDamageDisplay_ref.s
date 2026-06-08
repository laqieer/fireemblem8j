	.section .rodata.dat_gProcScr_PoisonDamageDisplay_ref, "a", %progbits
@ gProcScr_PoisonDamageDisplay: region-different data, JP 0x085c6890 read from funcmap-aligned code literal (US 0x0859e368); incbin baserom.gba
	.global gProcScr_PoisonDamageDisplay
gProcScr_PoisonDamageDisplay:
	.incbin "baserom.gba", 0x5C6890, 0x68
