	.section .rodata.dat_classchg_data, "a", %progbits
@ src/classchg-data.o: region-same content at JP 0x089cdd18 (US 0x0895dfa4, shift -0x-6FD74); incbin baserom.gba
	.global gPromoJidLut
gPromoJidLut:
	.incbin "baserom.gba", 0x9CDD18, 0x100
	.global gAnimCharaPalConfig
gAnimCharaPalConfig:
	.incbin "baserom.gba", 0x9CDE18, 0x700
	.global gAnimCharaPalConfigUnused
gAnimCharaPalConfigUnused:
	.incbin "baserom.gba", 0x9CE518, 0x700
	.global gAnimCharaPalIt
gAnimCharaPalIt:
	.incbin "baserom.gba", 0x9CEC18, 0x700
