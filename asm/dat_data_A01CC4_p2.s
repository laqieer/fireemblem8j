	.section .rodata.dat_data_A01CC4_p2, "a", %progbits
@ src/data/data_A01CC4.o: region-same content at JP 0x08a7b098 (US 0x08a07dd8, shift -0xFFF8CD40); incbin baserom.gba
	.global Img_ChapterIntroFog
Img_ChapterIntroFog:
	.incbin "graphics/misc_gfx2/Img_ChapterIntroFog.bin.lz"
	.global Pal_PlayerRankFog
Pal_PlayerRankFog:
	.incbin "graphics/misc_gfx2/Pal_PlayerRankFog.gbapal"
	.global Img_PlayerRankFog
Img_PlayerRankFog:
	.incbin "graphics/misc_gfx2/Img_PlayerRankFog.bin.lz"
