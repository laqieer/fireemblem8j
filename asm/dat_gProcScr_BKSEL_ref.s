	.section .rodata.dat_gProcScr_BKSEL_ref, "a", %progbits
@ gProcScr_BKSEL: region-different data, JP 0x085c6a48 read from funcmap-aligned code literal (US 0x0859e520); incbin baserom.gba
	.global gProcScr_BKSEL
gProcScr_BKSEL:
	.incbin "baserom.gba", 0x5C6A48, 0x80
