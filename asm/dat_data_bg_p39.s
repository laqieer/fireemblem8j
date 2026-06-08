	.section .rodata.dat_data_bg_p39, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089c2ac0 (US 0x089539ec, shift -0xFFF90F2C); incbin baserom.gba
	.global bg_Volcano_palette
bg_Volcano_palette:
	.incbin "baserom.gba", 0x9C2AC0, 0x100
