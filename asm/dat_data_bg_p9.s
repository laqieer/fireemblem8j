	.section .rodata.dat_data_bg_p9, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0894ba94 (US 0x088f100c, shift -0xFFFA5578); incbin baserom.gba
	.global bg_Castle_Interior_palette
bg_Castle_Interior_palette:
	.incbin "baserom.gba", 0x94BA94, 0x100
	.global bg_Castle_Night_palette
bg_Castle_Night_palette:
	.incbin "baserom.gba", 0x94BB94, 0x100
