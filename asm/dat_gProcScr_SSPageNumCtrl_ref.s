	.section .rodata.dat_gProcScr_SSPageNumCtrl_ref, "a", %progbits
@ gProcScr_SSPageNumCtrl: region-different data, JP 0x08a72a30 read from funcmap-aligned code literal (US 0x08a00978); incbin baserom.gba
	.global gProcScr_SSPageNumCtrl
gProcScr_SSPageNumCtrl:
	.incbin "baserom.gba", 0xA72A30, 0x50
