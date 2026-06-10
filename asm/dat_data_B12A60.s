	.section .rodata.dat_data_B12A60, "a", %progbits
	.align 2
@ src/data/data_B12A60.o: region-same content at JP 0x08babe04 (US 0x08b12db4, shift -0x-99050); incbin baserom.gba
	.global Img_CommGameBgScreen
Img_CommGameBgScreen:
	.incbin "graphics/misc_gfx2/Img_CommGameBgScreen.bin.lz"
	.global Pal_CommGameBgScreenInShop
Pal_CommGameBgScreenInShop:
	.incbin "graphics/misc_gfx2/Pal_CommGameBgScreenInShop.gbapal"
	.global Pal_UnkData_2
Pal_UnkData_2:
	.incbin "graphics/misc_gfx2/Pal_UnkData_2.gbapal"
	.global Tsa_UnkData_5
Tsa_UnkData_5:
	.incbin "graphics/misc_gfx2/Tsa_UnkData_5.bin.lz"
	.global Img_UnkData_2
Img_UnkData_2:
	.incbin "graphics/misc_gfx2/Img_UnkData_2.bin.lz"
