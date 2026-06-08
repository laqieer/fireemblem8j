	.section .rodata.dat_ProcScr_PhaseIntro_ref, "a", %progbits
@ ProcScr_PhaseIntro: region-different data, JP 0x085c3400 read from funcmap-aligned code literal (US 0x0859af80); incbin baserom.gba
	.global ProcScr_PhaseIntro
ProcScr_PhaseIntro:
	.incbin "baserom.gba", 0x5C3400, 0x48
