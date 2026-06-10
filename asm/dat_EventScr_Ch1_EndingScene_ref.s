	.section .rodata.dat_EventScr_Ch1_EndingScene_ref, "a", %progbits
@ EventScr_Ch1_EndingScene: region-different data, JP 0x08a61bfc read from funcmap-aligned code literal (US 0x089efac4); incbin baserom.gba
	.global EventScr_Ch1_EndingScene
EventScr_Ch1_EndingScene:
	.incbin "data/residual/EventScr_Ch1_EndingScene.bin"
