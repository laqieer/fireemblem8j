	.section .rodata.dat_menu_save_main_bg_p0, "a", %progbits
@ src/data/menu/menu_save_main_bg.o: region-same content at JP 0x08a9e5c0 (US 0x08a21658, shift -0xFFF83098); incbin baserom.gba
	.global Img_SaveMenuBG
Img_SaveMenuBG:
	.incbin "baserom.gba", 0xA9E5C0, 0x4774
	.global Pal_SaveMenuBG
Pal_SaveMenuBG:
	.incbin "baserom.gba", 0xAA2D34, 0x100
	.global Tsa_SaveMenuBG
Tsa_SaveMenuBG:
	.incbin "baserom.gba", 0xAA2E34, 0x4B4
	.global Img_MainMenuBgFog
Img_MainMenuBgFog:
	.incbin "baserom.gba", 0xAA32E8, 0x558
	.global Pal_MainMenuBgFog
Pal_MainMenuBgFog:
	.incbin "baserom.gba", 0xAA3840, 0x20
