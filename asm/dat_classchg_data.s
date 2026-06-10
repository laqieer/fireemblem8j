	.section .rodata.dat_classchg_data, "a", %progbits
@ src/classchg-data.o: region-same content at JP 0x089cdd18 (US 0x0895dfa4, shift -0x-6FD74); incbin baserom.gba
	.global gPromoJidLut
gPromoJidLut:
	.incbin "data/residual/gPromoJidLut.bin"
	.global gAnimCharaPalConfig
gAnimCharaPalConfig:
	.incbin "data/residual/gAnimCharaPalConfig.bin"
	.global gAnimCharaPalConfigUnused
gAnimCharaPalConfigUnused:
	.incbin "data/residual/gAnimCharaPalConfigUnused.bin"
	.global gAnimCharaPalIt
gAnimCharaPalIt:
	.incbin "data/residual/gAnimCharaPalIt.bin"
