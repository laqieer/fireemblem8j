	.section .rodata.dat_gProcScr_PhaseIntroText_ref, "a", %progbits
@ gProcScr_PhaseIntroText: region-different data, JP 0x085c3378 read from funcmap-aligned code literal (US 0x0859aef8); incbin baserom.gba
	.global gProcScr_PhaseIntroText
gProcScr_PhaseIntroText:
	.incbin "baserom.gba", 0x5C3378, 0x48
