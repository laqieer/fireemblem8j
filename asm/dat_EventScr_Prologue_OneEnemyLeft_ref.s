	.section .rodata.dat_EventScr_Prologue_OneEnemyLeft_ref, "a", %progbits
@ EventScr_Prologue_OneEnemyLeft: region-different data, JP 0x08a61210 read from funcmap-aligned code literal (US 0x089ef0d8); incbin baserom.gba
	.global EventScr_Prologue_OneEnemyLeft
EventScr_Prologue_OneEnemyLeft:
	.incbin "baserom.gba", 0xA61210, 0x54
