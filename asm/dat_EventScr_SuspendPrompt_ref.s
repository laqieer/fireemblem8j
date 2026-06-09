	.section .rodata.dat_EventScr_SuspendPrompt_ref, "a", %progbits
@ EventScr_SuspendPrompt: region-different data, JP 0x085b9e9c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_SuspendPrompt
EventScr_SuspendPrompt:
	.incbin "baserom.gba", 0x5B9E9C, 0x4C
