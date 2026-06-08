	.section .rodata.dat_data_A01CC4_p2, "a", %progbits
@ src/data/data_A01CC4.o: region-same content at JP 0x08a7b098 (US 0x08a07dd8, shift -0xFFF8CD40); incbin baserom.gba
	.global Img_ChapterIntroFog
Img_ChapterIntroFog:
	.incbin "baserom.gba", 0xA7B098, 0x1C84
	.global Pal_PlayerRankFog
Pal_PlayerRankFog:
	.incbin "baserom.gba", 0xA7CD1C, 0x20
	.global Img_PlayerRankFog
Img_PlayerRankFog:
	.incbin "baserom.gba", 0xA7CD3C, 0x68
