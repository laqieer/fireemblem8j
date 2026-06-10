	.section .rodata.dat_worldmap_gmapunit_p680, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085b9308 (US 0x08591570, shift -0xFFFD8268); incbin baserom.gba
	.global gTalkFaceHPosLut
gTalkFaceHPosLut:
	.incbin "data/residual/gTalkFaceHPosLut.bin"
	.global gSprite_TalkTextFront
gSprite_TalkTextFront:
	.incbin "data/residual/gSprite_TalkTextFront.bin"
	.global gSprite_TalkTextBack
gSprite_TalkTextBack:
	.incbin "data/residual/gSprite_TalkTextBack.bin"
