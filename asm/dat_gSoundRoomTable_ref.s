	.section .rodata.dat_gSoundRoomTable_ref, "a", %progbits
@ gSoundRoomTable: region-different data, JP 0x08a9dddc read from funcmap-aligned code literal (US 0x08a20e74); incbin baserom.gba
	.global gSoundRoomTable
gSoundRoomTable:
	.incbin "baserom.gba", 0xA9DDDC, 0x460
