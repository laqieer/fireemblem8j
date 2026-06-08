	.section .rodata.dat_worldmap_gmapunit_p1638, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08aadc58 (US 0x08a2d32c, shift -0xFFF7F6D4); incbin baserom.gba
	.global Img_PlayStatusSprites
Img_PlayStatusSprites:
	.incbin "baserom.gba", 0xAADC58, 0xE8C
	.global Pal_PlayStatusSprites
Pal_PlayStatusSprites:
	.incbin "baserom.gba", 0xAAEAE4, 0x40
	.global Img_ChapterStatusSelectorSprite
Img_ChapterStatusSelectorSprite:
	.incbin "baserom.gba", 0xAAEB24, 0x1C
