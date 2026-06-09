	.section .rodata.dat_EventScr_Ch9A_2_ref, "a", %progbits
@ EventScr_Ch9A_2: region-different data, JP 0x08a660d0; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Ch9A_2
EventScr_Ch9A_2:
	.incbin "baserom.gba", 0xA660D0, 0x40
