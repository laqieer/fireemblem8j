	.section .rodata.dat_data_bg_p15, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08963410 (US 0x089052a0, shift -0xFFFA1E90); incbin baserom.gba
	.global bg_Manse_Back_palette
bg_Manse_Back_palette:
	.incbin "baserom.gba", 0x963410, 0x100
	.global bg_Manse_Flashback_palette
bg_Manse_Flashback_palette:
	.incbin "baserom.gba", 0x963510, 0x100
