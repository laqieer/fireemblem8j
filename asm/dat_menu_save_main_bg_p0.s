	.section .rodata.dat_menu_save_main_bg_p0, "a", %progbits
@ src/data/menu/menu_save_main_bg.o: region-same content at JP 0x08a9e5c0 (US 0x08a21658, shift -0xFFF83098); incbin baserom.gba
	.global Img_SaveMenuBG
Img_SaveMenuBG:
	.incbin "graphics/misc_gfx2/Img_SaveMenuBG.bin.lz"
	.global Pal_SaveMenuBG
Pal_SaveMenuBG:
	.incbin "graphics/misc_gfx2/Pal_SaveMenuBG.gbapal"
	.global Tsa_SaveMenuBG
Tsa_SaveMenuBG:
	.incbin "graphics/misc_gfx2/Tsa_SaveMenuBG.bin"
	.global Img_MainMenuBgFog
Img_MainMenuBgFog:
	.incbin "graphics/misc_gfx2/Img_MainMenuBgFog.bin.lz"
	.global Pal_MainMenuBgFog
Pal_MainMenuBgFog:
	.incbin "graphics/misc_gfx2/Pal_MainMenuBgFog.gbapal"
