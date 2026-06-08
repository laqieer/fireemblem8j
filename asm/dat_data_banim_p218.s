	.section .rodata.dat_data_banim_p218, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x087512b0 (US 0x087246d8, shift -0xFFFD3428); incbin baserom.gba
	.global Img_FireBreathBg
Img_FireBreathBg:
	.incbin "baserom.gba", 0x7512B0, 0x13F8
	.global Pal_FireBreathBg
Pal_FireBreathBg:
	.incbin "baserom.gba", 0x7526A8, 0x20
	.global Tsa_FireBreathBg
Tsa_FireBreathBg:
	.incbin "baserom.gba", 0x7526C8, 0x2BC
	.global Pal_Banim_7
Pal_Banim_7:
	.incbin "baserom.gba", 0x752984, 0x20
	.global Img_ShineBg1
Img_ShineBg1:
	.incbin "baserom.gba", 0x7529A4, 0x1228
	.global Pal_ShineBg_0
Pal_ShineBg_0:
	.incbin "baserom.gba", 0x753BCC, 0xC0
	.global Tsa_ShineBg1_Left
Tsa_ShineBg1_Left:
	.incbin "baserom.gba", 0x753C8C, 0x45C
	.global Tsa_ShineBg1_Right
Tsa_ShineBg1_Right:
	.incbin "baserom.gba", 0x7540E8, 0x45C
	.global Img_ShineBg2
Img_ShineBg2:
	.incbin "baserom.gba", 0x754544, 0x2DC
	.global Pal_ShineBg2
Pal_ShineBg2:
	.incbin "baserom.gba", 0x754820, 0x20
