	.section .rodata.dat_data_banim_p19, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08607c40 (US 0x085dd518, shift -0xFFFD58D8); incbin baserom.gba
	.global Tsa_BreathBgBase
Tsa_BreathBgBase:
	.global gUnk_EfxSongObj2
gUnk_EfxSongObj2:
	.incbin "baserom.gba", 0x607C40, 0x21C
	.global Pal_BreathBgBase
Pal_BreathBgBase:
	.incbin "baserom.gba", 0x607E5C, 0x3C0
	.global Tsa_BreathBgBase_1
Tsa_BreathBgBase_1:
	.incbin "baserom.gba", 0x60821C, 0x170
