	.section .rodata.dat_EventScr_Ch2Tutorial2_ref, "a", %progbits
@ EventScr_Ch2Tutorial2: region-different data, JP 0x08a629b4 read from funcmap-aligned code literal (US 0x089f0880); incbin baserom.gba
	.global EventScr_Ch2Tutorial2
EventScr_Ch2Tutorial2:
	.incbin "baserom.gba", 0xA629B4, 0x60
