	.section .rodata.dat_data_titlescreen, "a", %progbits
	.align 2
@ src/data/data_titlescreen.o: region-same content at JP 0x08b3fcf4 (US 0x08aa7760, shift -0x-98594); incbin baserom.gba
	.global gGfx_TitleMainBackground_1
gGfx_TitleMainBackground_1:
	.incbin "baserom.gba", 0xB3FCF4, 0x1FA8
	.global gGfx_TitleMainBackground_2
gGfx_TitleMainBackground_2:
	.incbin "baserom.gba", 0xB41C9C, 0x1788
	.global gTsa_TitleMainBackground
gTsa_TitleMainBackground:
	.incbin "baserom.gba", 0xB43424, 0x564
	.global gPal_TitleMainBackground
gPal_TitleMainBackground:
	.incbin "baserom.gba", 0xB43988, 0x20
	.global gGfx_TitleDragonForeground
gGfx_TitleDragonForeground:
	.incbin "baserom.gba", 0xB439A8, 0xE90
	.global gTsa_TitleDragonForeground
gTsa_TitleDragonForeground:
	.incbin "baserom.gba", 0xB44838, 0x2E8
	.global gPal_TitleDragonForeground
gPal_TitleDragonForeground:
	.incbin "baserom.gba", 0xB44B20, 0x20
