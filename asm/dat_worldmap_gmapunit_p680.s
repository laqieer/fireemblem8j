	.section .rodata.dat_worldmap_gmapunit_p680, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085b9308 (US 0x08591570, shift -0xFFFD8268); incbin baserom.gba
	.global gTalkFaceHPosLut
gTalkFaceHPosLut:
	.incbin "baserom.gba", 0x5B9308, 0x20
	.global gSprite_TalkTextFront
gSprite_TalkTextFront:
	.incbin "baserom.gba", 0x5B9328, 0x1A
	.global gSprite_TalkTextBack
gSprite_TalkTextBack:
	.incbin "baserom.gba", 0x5B9342, 0x4A
