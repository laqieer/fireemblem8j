	.section .rodata.dat_EventScr_Prologue_TutorialA_ref, "a", %progbits
@ EventScr_Prologue_TutorialA: region-different data, JP 0x08a61818; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_Prologue_TutorialA
EventScr_Prologue_TutorialA:
	.incbin "baserom.gba", 0xA61818, 0x78
