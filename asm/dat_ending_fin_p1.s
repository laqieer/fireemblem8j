	.section .rodata.dat_ending_fin_p1, "a", %progbits
@ src/data/ending/ending_fin.o: region-same content at JP 0x08ac6c98 (US 0x08a40ad4, shift -0xFFF79E3C); incbin baserom.gba
	.global Pal_FinScreen_1
Pal_FinScreen_1:
	.incbin "graphics/misc_gfx2/Pal_FinScreen_1.gbapal"
	.global Tsa_EndingFin
Tsa_EndingFin:
	.incbin "graphics/misc_gfx2/Tsa_EndingFin.bin"
