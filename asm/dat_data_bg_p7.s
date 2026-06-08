	.section .rodata.dat_data_bg_p7, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08944f34 (US 0x088ebb7c, shift -0xFFFA6C48); incbin baserom.gba
	.global bg_Ship_palette
bg_Ship_palette:
	.incbin "baserom.gba", 0x944F34, 0x100
