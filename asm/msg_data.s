	.section .rodata.msg_data, "a", %progbits
@ JP message text + gMsgTable (region-different / Japanese, 3339 msgs).
@ Block 0x080ed7f4..0x081504b8; boundary from GetStringFromIndex literal (gMsgTable
@ JP 0x0814d08c) + the JP table end (= next carved object). incbin baserom.gba.
	.incbin "baserom.gba", 0xED7F4, 0x5F898
	.global gMsgTable
gMsgTable:
	.incbin "baserom.gba", 0x14D08C, 0x342C
