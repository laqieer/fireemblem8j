	.section .rodata.dat_data_banim_p225, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0875ae34 (US 0x0872e25c, shift -0xFFFD3428); incbin baserom.gba
	.global Img_ExcaliburBg1
Img_ExcaliburBg1:
	.incbin "baserom.gba", 0x75AE34, 0x3F0
	.global Pal_ExcaliburBg1
Pal_ExcaliburBg1:
	.incbin "baserom.gba", 0x75B224, 0x1A0
	.global Tsa_ExcaliburBg1
Tsa_ExcaliburBg1:
	.incbin "baserom.gba", 0x75B3C4, 0x1AC
	.global Img_ExcaliburBg2
Img_ExcaliburBg2:
	.incbin "baserom.gba", 0x75B570, 0x106C
	.global Pal_ExcaliburBg2
Pal_ExcaliburBg2:
	.incbin "baserom.gba", 0x75C5DC, 0x80
	.global Tsa_ExcaliburBg2_Left
Tsa_ExcaliburBg2_Left:
	.incbin "baserom.gba", 0x75C65C, 0x434
	.global Tsa_ExcaliburBg2_Right
Tsa_ExcaliburBg2_Right:
	.incbin "baserom.gba", 0x75CA90, 0x3EC
	.global Pal_ExcaliburBg3
Pal_ExcaliburBg3:
	.incbin "baserom.gba", 0x75CE7C, 0x80
