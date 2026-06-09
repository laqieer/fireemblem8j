	.section .rodata.dat_MelkaenCoastMapChanges_ref, "a", %progbits
@ MelkaenCoastMapChanges: region-different data, JP 0x08a5e560; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global MelkaenCoastMapChanges
MelkaenCoastMapChanges:
	.incbin "baserom.gba", 0xA5E560, 0x16C
