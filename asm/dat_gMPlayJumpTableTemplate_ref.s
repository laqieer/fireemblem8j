	.section .rodata.dat_gMPlayJumpTableTemplate_ref, "a", %progbits
@ gMPlayJumpTableTemplate: region-different data, JP 0x081f6e40; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gMPlayJumpTableTemplate
gMPlayJumpTableTemplate:
	.incbin "data/residual/gMPlayJumpTableTemplate.bin"
