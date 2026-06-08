	.section .rodata.dat_gProcScr_GorgonEggHatchDisplay_ref, "a", %progbits
@ gProcScr_GorgonEggHatchDisplay: region-different data, JP 0x085c68f8 read from funcmap-aligned code literal (US 0x0859e3d0); incbin baserom.gba
	.global gProcScr_GorgonEggHatchDisplay
gProcScr_GorgonEggHatchDisplay:
	.incbin "baserom.gba", 0x5C68F8, 0x68
