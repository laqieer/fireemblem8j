	.section .rodata.dat_data_bg_p18, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08968fc4 (US 0x0890a318, shift -0xFFFA1354); incbin baserom.gba
	.global bg_Plain_1_Fog_palette
bg_Plain_1_Fog_palette:
	.incbin "baserom.gba", 0x968FC4, 0x100
