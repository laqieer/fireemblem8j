	.section .rodata.dat_data_bg_p12, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08958030 (US 0x088fb804, shift -0xFFFA37D4); incbin baserom.gba
	.global bg_Castle_Bright_palette
bg_Castle_Bright_palette:
	.incbin "baserom.gba", 0x958030, 0x100
	.global bg_Castle_Dark_palette
bg_Castle_Dark_palette:
	.incbin "baserom.gba", 0x958130, 0x100
