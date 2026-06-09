	.section .rodata.dat_EventScr_Ruin_64_ref, "a", %progbits
@ EventScr_Ruin_64: region-different data, JP 0x08a72044; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Ruin_64
EventScr_Ruin_64:
	.incbin "baserom.gba", 0xA72044, 0x9C
