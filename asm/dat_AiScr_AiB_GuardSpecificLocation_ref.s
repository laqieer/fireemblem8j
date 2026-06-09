	.section .rodata.dat_AiScr_AiB_GuardSpecificLocation_ref, "a", %progbits
@ AiScr_AiB_GuardSpecificLocation: region-different data, JP 0x085d2fd0 read from funcmap-aligned code literal (US 0x085a90c8); incbin baserom.gba
	.global AiScr_AiB_GuardSpecificLocation
AiScr_AiB_GuardSpecificLocation:
	.incbin "baserom.gba", 0x5D2FD0, 0x70
