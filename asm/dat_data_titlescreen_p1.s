	.section .rodata.dat_data_titlescreen_p1, "a", %progbits
@ src/data/data_titlescreen.o: region-same content at JP 0x08b4678c (US 0x08aadb68, shift -0xFFF673DC); incbin baserom.gba
	.global gPal_PressStart
gPal_PressStart:
	.incbin "graphics/misc_gfx/gPal_PressStart.gbapal"
	.global gPal_Titlescreen_0
gPal_Titlescreen_0:
	.incbin "graphics/misc_gfx/gPal_Titlescreen_0.gbapal"
	.global gGfx_Titlescreen_0
gGfx_Titlescreen_0:
	.incbin "graphics/misc_gfx/gGfx_Titlescreen_0.bin.lz"
	.global gTsa_Titlescreen_0
gTsa_Titlescreen_0:
	.incbin "baserom.gba", 0xB47240, 0x2B0
	.global gPal_Titlescreen_1
gPal_Titlescreen_1:
	.incbin "graphics/misc_gfx/gPal_Titlescreen_1.gbapal"
	.global gGfx_Titlescreen_1
gGfx_Titlescreen_1:
	.incbin "graphics/misc_gfx/gGfx_Titlescreen_1.bin.lz"
	.global gTsa_Titlescreen_1
gTsa_Titlescreen_1:
	.incbin "baserom.gba", 0xB4854C, 0x3CC
	.global gPal_Titlescreen_2
gPal_Titlescreen_2:
	.incbin "graphics/misc_gfx/gPal_Titlescreen_2.gbapal"
	.global gGfx_Titlescreen_2
gGfx_Titlescreen_2:
	.incbin "graphics/misc_gfx/gGfx_Titlescreen_2.bin.lz"
	.global gTsa_Titlescreen_2
gTsa_Titlescreen_2:
	.incbin "baserom.gba", 0xB48B34, 0x204
