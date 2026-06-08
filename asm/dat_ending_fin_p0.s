	.section .rodata.dat_ending_fin_p0, "a", %progbits
@ src/data/ending/ending_fin.o: region-same content at JP 0x08ac4c88 (US 0x08a405b4, shift -0xFFF7B92C); incbin baserom.gba
	.global Pal_FinScreen
Pal_FinScreen:
	.incbin "baserom.gba", 0xAC4C88, 0x20
	.global Img_FinScreen
Img_FinScreen:
	.incbin "baserom.gba", 0xAC4CA8, 0x3FC
