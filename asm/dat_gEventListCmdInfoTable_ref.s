	.section .rodata.dat_gEventListCmdInfoTable_ref, "a", %progbits
@ gEventListCmdInfoTable: region-different data, JP 0x08a5a618; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gEventListCmdInfoTable
gEventListCmdInfoTable:
	.incbin "baserom.gba", 0xA5A618, 0x88
