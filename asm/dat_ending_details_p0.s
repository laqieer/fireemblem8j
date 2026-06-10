	.section .rodata.dat_ending_details_p0, "a", %progbits
@ src/data/ending/ending_details.o: region-same content at JP 0x08ac2be0 (US 0x08a3f21c, shift -0xFFF7C63C); incbin baserom.gba
	.global gEndingDetails_0
gEndingDetails_0:
	.incbin "data/residual/gEndingDetails_0.bin"
	.global Pal_EndingDetails_0
Pal_EndingDetails_0:
	.incbin "graphics/misc_gfx2/Pal_EndingDetails_0.gbapal"
	.global Pal_CharacterEndingMenu
Pal_CharacterEndingMenu:
	.incbin "graphics/misc_gfx2/Pal_CharacterEndingMenu.gbapal"
	.global Img_CharacterEndingMenu
Img_CharacterEndingMenu:
	.incbin "graphics/misc_gfx2/Img_CharacterEndingMenu.bin.lz"
	.global Tsa_CharacterEnding_TopBorder
Tsa_CharacterEnding_TopBorder:
	.incbin "graphics/misc_gfx2/Tsa_CharacterEnding_TopBorder.bin"
	.global Tsa_CharacterEnding_BottomBorder
Tsa_CharacterEnding_BottomBorder:
	.incbin "graphics/misc_gfx2/Tsa_CharacterEnding_BottomBorder.bin"
