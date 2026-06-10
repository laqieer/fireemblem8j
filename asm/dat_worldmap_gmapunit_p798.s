	.section .rodata.dat_worldmap_gmapunit_p798, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08604ed4 (US 0x085da7ac, shift -0xFFFD58D8); incbin baserom.gba
	.global Img_EfxArrowOBJ
Img_EfxArrowOBJ:
	.incbin "graphics/gmapunit/Img_EfxArrowOBJ.bin.lz"
	.global AnimSprite_EfxArrowObj1
AnimSprite_EfxArrowObj1:
	.global Obj_EfxArrowOBJ
Obj_EfxArrowOBJ:
	.incbin "baserom.gba", 0x604F10, 0x24
	.global AnimSprite_EfxArrowObj2
AnimSprite_EfxArrowObj2:
	.incbin "baserom.gba", 0x604F34, 0x24
	.global AnimSprite_EfxArrowObj3
AnimSprite_EfxArrowObj3:
	.incbin "baserom.gba", 0x604F58, 0x24
