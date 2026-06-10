	.section .rodata.dat_data_titlescreen, "a", %progbits
	.align 2
@ src/data/data_titlescreen.o: region-same content at JP 0x08b3fcf4 (US 0x08aa7760, shift -0x-98594); incbin baserom.gba
	.global gGfx_TitleMainBackground_1
gGfx_TitleMainBackground_1:
	.incbin "graphics/misc_gfx/gGfx_TitleMainBackground_1.bin.lz"
	.global gGfx_TitleMainBackground_2
gGfx_TitleMainBackground_2:
	.incbin "graphics/misc_gfx/gGfx_TitleMainBackground_2.bin.lz"
	.global gTsa_TitleMainBackground
gTsa_TitleMainBackground:
	.incbin "baserom.gba", 0xB43424, 0x564
	.global gPal_TitleMainBackground
gPal_TitleMainBackground:
	.incbin "graphics/misc_gfx/gPal_TitleMainBackground.gbapal"
	.global gGfx_TitleDragonForeground
gGfx_TitleDragonForeground:
	.incbin "graphics/misc_gfx/gGfx_TitleDragonForeground.bin.lz"
	.global gTsa_TitleDragonForeground
gTsa_TitleDragonForeground:
	.incbin "baserom.gba", 0xB44838, 0x2E8
	.global gPal_TitleDragonForeground
gPal_TitleDragonForeground:
	.incbin "graphics/misc_gfx/gPal_TitleDragonForeground.gbapal"
