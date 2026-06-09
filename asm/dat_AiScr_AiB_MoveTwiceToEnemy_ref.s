	.section .rodata.dat_AiScr_AiB_MoveTwiceToEnemy_ref, "a", %progbits
@ AiScr_AiB_MoveTwiceToEnemy: region-different data, JP 0x085d2528 read from funcmap-aligned code literal (US 0x085a8620); incbin baserom.gba
	.global AiScr_AiB_MoveTwiceToEnemy
AiScr_AiB_MoveTwiceToEnemy:
	.incbin "baserom.gba", 0x5D2528, 0x70
