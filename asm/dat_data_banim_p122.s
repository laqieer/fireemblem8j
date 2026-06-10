	.section .rodata.dat_data_banim_p122, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0869ceac (US 0x086702d4, shift -0xFFFD3428); incbin baserom.gba
	.global Img_HealSprites_Sparkles
Img_HealSprites_Sparkles:
	.incbin "graphics/banim/_us/banim/assets/img/006702D4_Img_HealSprites_Sparkles.4bpp.lz"
	.global Pal_HealSprites_Sparkles
Pal_HealSprites_Sparkles:
	.incbin "graphics/banim/_us/banim/assets/pal/00670528_Pal_HealSprites_Sparkles.gbapal"
	.global Img_EfxLiveBG_B
Img_EfxLiveBG_B:
	.incbin "baserom.gba", 0x69D120, 0x7F8
	.global Tsa_EfxLiveBG_B_L
Tsa_EfxLiveBG_B_L:
	.incbin "graphics/banim/_us/banim/assets/tsa/00670D40_Tsa_EfxLiveBG_B_L.map.bin"
	.global Tsa_EfxLiveBG_B_R
Tsa_EfxLiveBG_B_R:
	.incbin "graphics/banim/_us/banim/assets/tsa/006716A0_Tsa_EfxLiveBG_B_R.map.bin"
