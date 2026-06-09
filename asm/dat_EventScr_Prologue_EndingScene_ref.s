	.section .rodata.dat_EventScr_Prologue_EndingScene_ref, "a", %progbits
@ EventScr_Prologue_EndingScene: region-different data, JP 0x08a6129c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Prologue_EndingScene
EventScr_Prologue_EndingScene:
	.incbin "baserom.gba", 0xA6129C, 0x58
