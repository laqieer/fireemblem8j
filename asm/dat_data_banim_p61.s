	.section .rodata.dat_data_banim_p61, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0861f998 (US 0x085f2dc0, shift -0xFFFD3428); incbin baserom.gba
	.global Img_ThunderSpellBg
Img_ThunderSpellBg:
	.incbin "data/residual/Img_ThunderSpellBg.bin"
	.global Pal_ThunderSpellBg
Pal_ThunderSpellBg:
	.incbin "graphics/banim/_us/banim/assets/pal/005F367C_Pal_ThunderSpellBg.agbpal"
	.global Tsa_EfxThuderBg1
Tsa_EfxThuderBg1:
	.incbin "graphics/banim/_us/banim/assets/tsa/005F387C_Tsa_EfxThuderBg1.map.bin.lz"
	.global Tsa_EfxThuderBg2
Tsa_EfxThuderBg2:
	.incbin "graphics/banim/_us/banim/assets/tsa/005F3948_Tsa_EfxThuderBg2.map.bin.lz"
	.global Img_BoltingSprites
Img_BoltingSprites:
	.incbin "graphics/banim/_us/banim/assets/img/005F3AA8_Img_BoltingSprites.4bpp.lz"
	.global Pal_BoltingSprites
Pal_BoltingSprites:
	.incbin "graphics/banim/_us/banim/assets/pal/005F3F40_Pal_BoltingSprites.gbapal"
