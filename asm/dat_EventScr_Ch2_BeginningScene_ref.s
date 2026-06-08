	.section .rodata.dat_EventScr_Ch2_BeginningScene_ref, "a", %progbits
@ EventScr_Ch2_BeginningScene: region-different data, JP 0x08a623d8 read from funcmap-aligned code literal (US 0x089f02a0); incbin baserom.gba
	.global EventScr_Ch2_BeginningScene
EventScr_Ch2_BeginningScene:
	.incbin "baserom.gba", 0xA623D8, 0x1E4
