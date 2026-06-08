	.section .rodata.dat_EventScr_Ch3_Turn1Npc_ref, "a", %progbits
@ EventScr_Ch3_Turn1Npc: region-different data, JP 0x08a63480 read from funcmap-aligned code literal (US 0x089f134c); incbin baserom.gba
	.global EventScr_Ch3_Turn1Npc
EventScr_Ch3_Turn1Npc:
	.incbin "baserom.gba", 0xA63480, 0x68
