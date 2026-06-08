	.section .rodata.dat_data_banim_p64, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08622210 (US 0x085f5638, shift -0xFFFD3428); incbin baserom.gba
	.global Img_FireSpellBg
Img_FireSpellBg:
	.incbin "baserom.gba", 0x622210, 0xBF8
	.global Pal_FireSpellBg
Pal_FireSpellBg:
	.incbin "baserom.gba", 0x622E08, 0x20
