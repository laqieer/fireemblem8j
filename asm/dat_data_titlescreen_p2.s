	.section .rodata.dat_data_titlescreen_p2, "a", %progbits
@ src/data/data_titlescreen.o: region-same content at JP 0x08b49b6c (US 0x08ab0b44, shift -0xFFF66FD8); incbin baserom.gba
	.global gGfx_TitleDemonKing
gGfx_TitleDemonKing:
	.incbin "graphics/misc_gfx/gGfx_TitleDemonKing.bin.lz"
	.global gTsa_TitleDemonKing
gTsa_TitleDemonKing:
	.incbin "data/residual/gTsa_TitleDemonKing.bin"
	.global gPal_TitleDemonKing
gPal_TitleDemonKing:
	.incbin "graphics/misc_gfx/gPal_TitleDemonKing.gbapal"
	.global gGfx_TitleLargeGlowingOrb
gGfx_TitleLargeGlowingOrb:
	.incbin "graphics/misc_gfx/gGfx_TitleLargeGlowingOrb.bin.lz"
	.global gPal_TitleLargeGlowingOrb
gPal_TitleLargeGlowingOrb:
	.incbin "graphics/misc_gfx/gPal_TitleLargeGlowingOrb.gbapal"
	.global gGfx_TitleSmallLightBubbles
gGfx_TitleSmallLightBubbles:
	.incbin "graphics/misc_gfx/gGfx_TitleSmallLightBubbles.bin.lz"
	.global gPal_TitleSmallLightBubbles
gPal_TitleSmallLightBubbles:
	.incbin "graphics/misc_gfx/gPal_TitleSmallLightBubbles.gbapal"
