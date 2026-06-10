	.section .rodata.dat_worldmap_gmapunit_p1638, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08aadc58 (US 0x08a2d32c, shift -0xFFF7F6D4); incbin baserom.gba
	.global Img_PlayStatusSprites
Img_PlayStatusSprites:
	.incbin "graphics/gmapunit/Img_PlayStatusSprites.bin.lz"
	.global Pal_PlayStatusSprites
Pal_PlayStatusSprites:
	.incbin "graphics/gmapunit/Pal_PlayStatusSprites.gbapal"
	.global Img_ChapterStatusSelectorSprite
Img_ChapterStatusSelectorSprite:
	.incbin "graphics/gmapunit/Img_ChapterStatusSelectorSprite.bin.lz"
