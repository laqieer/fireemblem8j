	.section .rodata.dat_data_banim_p19, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08607c40 (US 0x085dd518, shift -0xFFFD58D8); incbin baserom.gba
	.global Tsa_BreathBgBase
Tsa_BreathBgBase:
	.global gUnk_EfxSongObj2
gUnk_EfxSongObj2:
	.incbin "graphics/banim/_us/banim/assets/tsa/005DD518_Tsa_BreathBgBase.map.bin.lz"
	.global Pal_BreathBgBase
Pal_BreathBgBase:
	.incbin "graphics/banim/_us/banim/assets/pal/005DD734_Pal_BreathBgBase.agbpal"
	.global Tsa_BreathBgBase_1
Tsa_BreathBgBase_1:
	.incbin "graphics/banim/_us/banim/assets/tsa/005DDAF4_Tsa_085DDAF4.map.bin.lz"
