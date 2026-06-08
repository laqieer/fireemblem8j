	.section .rodata.dat_data_banim_p122, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0869ceac (US 0x086702d4, shift -0xFFFD3428); incbin baserom.gba
	.global Img_HealSprites_Sparkles
Img_HealSprites_Sparkles:
	.incbin "baserom.gba", 0x69CEAC, 0x254
	.global Pal_HealSprites_Sparkles
Pal_HealSprites_Sparkles:
	.incbin "baserom.gba", 0x69D100, 0x20
	.global Img_EfxLiveBG_B
Img_EfxLiveBG_B:
	.incbin "baserom.gba", 0x69D120, 0x7F8
	.global Tsa_EfxLiveBG_B_L
Tsa_EfxLiveBG_B_L:
	.incbin "baserom.gba", 0x69D918, 0x960
	.global Tsa_EfxLiveBG_B_R
Tsa_EfxLiveBG_B_R:
	.incbin "baserom.gba", 0x69E278, 0x960
