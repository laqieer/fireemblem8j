	.section .rodata.dat_EventScr_SuspendPrompt_ref, "a", %progbits
@ EventScr_SuspendPrompt: region-different data, JP 0x085b9e9c read from funcmap-aligned code literal (US 0x085920b8); incbin baserom.gba
	.global EventScr_SuspendPrompt
EventScr_SuspendPrompt:
	.incbin "baserom.gba", 0x5B9E9C, 0x4C
