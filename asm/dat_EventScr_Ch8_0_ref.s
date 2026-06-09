	.section .rodata.dat_EventScr_Ch8_0_ref, "a", %progbits
@ EventScr_Ch8_0: region-different data, JP 0x08a65258; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Ch8_0
EventScr_Ch8_0:
	.incbin "baserom.gba", 0xA65258, 0x68
