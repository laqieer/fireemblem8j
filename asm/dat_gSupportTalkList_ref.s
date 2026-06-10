	.section .rodata.dat_gSupportTalkList_ref, "a", %progbits
@ gSupportTalkList: region-different data, JP 0x08a5f230; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gSupportTalkList
gSupportTalkList:
	.incbin "data/residual/gSupportTalkList.bin"
