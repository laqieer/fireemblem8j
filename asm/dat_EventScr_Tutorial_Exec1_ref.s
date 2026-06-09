	.section .rodata.dat_EventScr_Tutorial_Exec1_ref, "a", %progbits
@ EventScr_Tutorial_Exec1: region-different data, JP 0x08a608cc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Tutorial_Exec1
EventScr_Tutorial_Exec1:
	.incbin "baserom.gba", 0xA608CC, 0x94
