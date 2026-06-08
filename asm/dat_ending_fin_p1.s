	.section .rodata.dat_ending_fin_p1, "a", %progbits
@ src/data/ending/ending_fin.o: region-same content at JP 0x08ac6c98 (US 0x08a40ad4, shift -0xFFF79E3C); incbin baserom.gba
	.global Pal_FinScreen_1
Pal_FinScreen_1:
	.incbin "baserom.gba", 0xAC6C98, 0x40
	.global Tsa_EndingFin
Tsa_EndingFin:
	.incbin "baserom.gba", 0xAC6CD8, 0x4B4
