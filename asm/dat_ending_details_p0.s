	.section .rodata.dat_ending_details_p0, "a", %progbits
@ src/data/ending/ending_details.o: region-same content at JP 0x08ac2be0 (US 0x08a3f21c, shift -0xFFF7C63C); incbin baserom.gba
	.global gEndingDetails_0
gEndingDetails_0:
	.incbin "baserom.gba", 0xAC2BE0, 0x4B4
	.global Pal_EndingDetails_0
Pal_EndingDetails_0:
	.incbin "baserom.gba", 0xAC3094, 0x40
	.global Pal_CharacterEndingMenu
Pal_CharacterEndingMenu:
	.incbin "baserom.gba", 0xAC30D4, 0x40
	.global Img_CharacterEndingMenu
Img_CharacterEndingMenu:
	.incbin "baserom.gba", 0xAC3114, 0x89C
	.global Tsa_CharacterEnding_TopBorder
Tsa_CharacterEnding_TopBorder:
	.incbin "baserom.gba", 0xAC39B0, 0x7C
	.global Tsa_CharacterEnding_BottomBorder
Tsa_CharacterEnding_BottomBorder:
	.incbin "baserom.gba", 0xAC3A2C, 0x7C
