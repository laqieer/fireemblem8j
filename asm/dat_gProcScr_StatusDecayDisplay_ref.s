	.section .rodata.dat_gProcScr_StatusDecayDisplay_ref, "a", %progbits
@ gProcScr_StatusDecayDisplay: region-different data, JP 0x085c6960 read from funcmap-aligned code literal (US 0x0859e438); incbin baserom.gba
	.global gProcScr_StatusDecayDisplay
gProcScr_StatusDecayDisplay:
	.incbin "baserom.gba", 0x5C6960, 0x58
