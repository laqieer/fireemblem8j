	.section .rodata.dat_gProcScr_SSPageNameCtrl_ref, "a", %progbits
@ gProcScr_SSPageNameCtrl: region-different data, JP 0x08a729f0 read from funcmap-aligned code literal (US 0x08a00938); incbin baserom.gba
	.global gProcScr_SSPageNameCtrl
gProcScr_SSPageNameCtrl:
	.incbin "baserom.gba", 0xA729F0, 0x40
