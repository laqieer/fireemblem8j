	.section .rodata.dat_data_titlescreen_p2, "a", %progbits
@ src/data/data_titlescreen.o: region-same content at JP 0x08b49b6c (US 0x08ab0b44, shift -0xFFF66FD8); incbin baserom.gba
	.global gGfx_TitleDemonKing
gGfx_TitleDemonKing:
	.incbin "baserom.gba", 0xB49B6C, 0xD4C
	.global gTsa_TitleDemonKing
gTsa_TitleDemonKing:
	.incbin "baserom.gba", 0xB4A8B8, 0x374
	.global gPal_TitleDemonKing
gPal_TitleDemonKing:
	.incbin "baserom.gba", 0xB4AC2C, 0x20
	.global gGfx_TitleLargeGlowingOrb
gGfx_TitleLargeGlowingOrb:
	.incbin "baserom.gba", 0xB4AC4C, 0x4E8
	.global gPal_TitleLargeGlowingOrb
gPal_TitleLargeGlowingOrb:
	.incbin "baserom.gba", 0xB4B134, 0x60
	.global gGfx_TitleSmallLightBubbles
gGfx_TitleSmallLightBubbles:
	.incbin "baserom.gba", 0xB4B194, 0x4C
	.global gPal_TitleSmallLightBubbles
gPal_TitleSmallLightBubbles:
	.incbin "baserom.gba", 0xB4B1E0, 0x20
