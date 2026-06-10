	.section .rodata.dat_gSoundRoomTable_ref, "a", %progbits
@ gSoundRoomTable: region-different data, JP 0x08a9dddc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gSoundRoomTable
gSoundRoomTable:
	.incbin "data/sound/gSoundRoomTable.bin"
