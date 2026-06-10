	.section .rodata.dat_data_banim_p162, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x086ba2a8 (US 0x0868d6d0, shift -0xFFFD3428); incbin baserom.gba
	.global Img_BarrierBg
Img_BarrierBg:
	.incbin "baserom.gba", 0x6BA2A8, 0x88C
	.global Pal_BarrierBg
Pal_BarrierBg:
	.incbin "graphics/banim/_us/banim/assets/pal/0068DF5C_Pal_BarrierBg.gbapal"
