	.section .rodata.dat_data_banim_p234, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0877abf4 (US 0x087456e8, shift -0xFFFCAAF4); incbin baserom.gba
	.global Pal_EfxChillEffectBG
Pal_EfxChillEffectBG:
	.incbin "graphics/banim/_us/banim/assets/pal/007456E8_Pal_EfxChillEffectBG.gbapal"
	.global Tsa1_EfxChillEffectBG
Tsa1_EfxChillEffectBG:
	.incbin "graphics/banim/_us/banim/assets/tsa/007457A8_Tsa1_EfxChillEffectBG.map.bin.lz"
	.global Tsa2_EfxChillEffectBG
Tsa2_EfxChillEffectBG:
	.incbin "graphics/banim/_us/banim/assets/tsa/00745B74_Tsa2_EfxChillEffectBG.map.bin.lz"
	.global Tsa3_EfxChillEffectBG
Tsa3_EfxChillEffectBG:
	.incbin "graphics/banim/_us/banim/assets/tsa/00745FD0_Tsa3_EfxChillEffectBG.map.bin.lz"
	.global AnimSprite_EfxChill_R_1
AnimSprite_EfxChill_R_1:
	.incbin "baserom.gba", 0x77B864, 0x30
