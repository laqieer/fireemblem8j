	.section .rodata.dat_data_titlescreen_p1, "a", %progbits
@ src/data/data_titlescreen.o: region-same content at JP 0x08b4678c (US 0x08aadb68, shift -0xFFF673DC); incbin baserom.gba
	.global gPal_PressStart
gPal_PressStart:
	.incbin "baserom.gba", 0xB4678C, 0x80
	.global gPal_Titlescreen_0
gPal_Titlescreen_0:
	.incbin "baserom.gba", 0xB4680C, 0x20
	.global gGfx_Titlescreen_0
gGfx_Titlescreen_0:
	.incbin "baserom.gba", 0xB4682C, 0xA14
	.global gTsa_Titlescreen_0
gTsa_Titlescreen_0:
	.incbin "baserom.gba", 0xB47240, 0x2B0
	.global gPal_Titlescreen_1
gPal_Titlescreen_1:
	.incbin "baserom.gba", 0xB474F0, 0x20
	.global gGfx_Titlescreen_1
gGfx_Titlescreen_1:
	.incbin "baserom.gba", 0xB47510, 0x103C
	.global gTsa_Titlescreen_1
gTsa_Titlescreen_1:
	.incbin "baserom.gba", 0xB4854C, 0x3CC
	.global gPal_Titlescreen_2
gPal_Titlescreen_2:
	.incbin "baserom.gba", 0xB48918, 0x20
	.global gGfx_Titlescreen_2
gGfx_Titlescreen_2:
	.incbin "baserom.gba", 0xB48938, 0x1FC
	.global gTsa_Titlescreen_2
gTsa_Titlescreen_2:
	.incbin "baserom.gba", 0xB48B34, 0x204
