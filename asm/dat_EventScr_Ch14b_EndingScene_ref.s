	.section .rodata.dat_EventScr_Ch14b_EndingScene_ref, "a", %progbits
@ EventScr_Ch14b_EndingScene: region-different data, JP 0x08a6e9ac read from funcmap-aligned code literal (US 0x089fc06c); incbin baserom.gba
	.global EventScr_Ch14b_EndingScene
EventScr_Ch14b_EndingScene:
	.incbin "baserom.gba", 0xA6E9AC, 0x1EC
