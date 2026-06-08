	.section .rodata.dat_EventScr_MapSupportConversation_ref, "a", %progbits
@ EventScr_MapSupportConversation: region-different data, JP 0x085b9dd4 read from funcmap-aligned code literal (US 0x08591ff0); incbin baserom.gba
	.global EventScr_MapSupportConversation
EventScr_MapSupportConversation:
	.incbin "baserom.gba", 0x5B9DD4, 0x40
