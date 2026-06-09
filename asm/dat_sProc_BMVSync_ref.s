	.section .rodata.dat_sProc_BMVSync_ref, "a", %progbits
@ sProc_BMVSync: region-different data, JP 0x085c5d98; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global sProc_BMVSync
sProc_BMVSync:
	.incbin "baserom.gba", 0x5C5D98, 0x50
