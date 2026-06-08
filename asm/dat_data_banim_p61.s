	.section .rodata.dat_data_banim_p61, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0861f998 (US 0x085f2dc0, shift -0xFFFD3428); incbin baserom.gba
	.global Img_ThunderSpellBg
Img_ThunderSpellBg:
	.incbin "baserom.gba", 0x61F998, 0x8BC
	.global Pal_ThunderSpellBg
Pal_ThunderSpellBg:
	.incbin "baserom.gba", 0x620254, 0x200
	.global Tsa_EfxThuderBg1
Tsa_EfxThuderBg1:
	.incbin "baserom.gba", 0x620454, 0xCC
	.global Tsa_EfxThuderBg2
Tsa_EfxThuderBg2:
	.incbin "baserom.gba", 0x620520, 0x160
	.global Img_BoltingSprites
Img_BoltingSprites:
	.incbin "baserom.gba", 0x620680, 0x498
	.global Pal_BoltingSprites
Pal_BoltingSprites:
	.incbin "baserom.gba", 0x620B18, 0xA0
