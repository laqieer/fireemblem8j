	.section .rodata.dat_gSupportTalkList_ref, "a", %progbits
@ gSupportTalkList: region-different data, JP 0x08a5f230 read from funcmap-aligned code literal (US 0x089ed10c); incbin baserom.gba
	.global gSupportTalkList
gSupportTalkList:
	.incbin "baserom.gba", 0xA5F230, 0x540
