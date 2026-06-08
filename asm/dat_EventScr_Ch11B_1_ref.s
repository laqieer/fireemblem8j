	.section .rodata.dat_EventScr_Ch11B_1_ref, "a", %progbits
@ EventScr_Ch11B_1: region-different data, JP 0x08a6d330 read from funcmap-aligned code literal (US 0x089fb250); incbin baserom.gba
	.global EventScr_Ch11B_1
EventScr_Ch11B_1:
	.incbin "baserom.gba", 0xA6D330, 0x44
