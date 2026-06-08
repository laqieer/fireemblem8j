	.section .rodata.dat_data_B12A60, "a", %progbits
	.align 2
@ src/data/data_B12A60.o: region-same content at JP 0x08babe04 (US 0x08b12db4, shift -0x-99050); incbin baserom.gba
	.global Img_CommGameBgScreen
Img_CommGameBgScreen:
	.incbin "baserom.gba", 0xBABE04, 0x4798
	.global Pal_CommGameBgScreenInShop
Pal_CommGameBgScreenInShop:
	.incbin "baserom.gba", 0xBB059C, 0x20
	.global Pal_UnkData_2
Pal_UnkData_2:
	.incbin "baserom.gba", 0xBB05BC, 0x160
	.global Tsa_UnkData_5
Tsa_UnkData_5:
	.incbin "baserom.gba", 0xBB071C, 0xF4
	.global Img_UnkData_2
Img_UnkData_2:
	.incbin "baserom.gba", 0xBB0810, 0xA4
