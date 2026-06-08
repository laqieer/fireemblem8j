	.section .rodata.dat_ProcScr_MapAnimEnd_ref, "a", %progbits
@ ProcScr_MapAnimEnd: region-different data, JP 0x08a13c38 read from funcmap-aligned code literal (US 0x089a35b0); incbin baserom.gba
	.global ProcScr_MapAnimEnd
ProcScr_MapAnimEnd:
	.incbin "baserom.gba", 0xA13C38, 0x98
