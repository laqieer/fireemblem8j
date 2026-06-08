	.section .rodata.dat_worldmap_gmapunit_p676, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085b8d84 (US 0x08590fec, shift -0xFFFD8268); incbin baserom.gba
	.global gDefaultFaceConfig
gDefaultFaceConfig:
	.incbin "baserom.gba", 0x5B8D84, 0x20
	.global gSprite_Face64x96
gSprite_Face64x96:
	.incbin "baserom.gba", 0x5B8DA4, 0x1A
	.global gSprite_Face64x96_Flipped
gSprite_Face64x96_Flipped:
	.incbin "baserom.gba", 0x5B8DBE, 0x1A
	.global gSprite_Face96x96
gSprite_Face96x96:
	.incbin "baserom.gba", 0x5B8DD8, 0x26
	.global gSprite_Face96x96_Flipped
gSprite_Face96x96_Flipped:
	.incbin "baserom.gba", 0x5B8DFE, 0x26
	.global gSprite_Face80x72
gSprite_Face80x72:
	.incbin "baserom.gba", 0x5B8E24, 0x32
	.global gSprite_Face80x72_Flipped
gSprite_Face80x72_Flipped:
	.incbin "baserom.gba", 0x5B8E56, 0x32
	.global gSprite_Face96x72
gSprite_Face96x72:
	.incbin "baserom.gba", 0x5B8E88, 0x32
	.global gSprite_Face96x72_Flipped
gSprite_Face96x72_Flipped:
	.incbin "baserom.gba", 0x5B8EBA, 0x32
