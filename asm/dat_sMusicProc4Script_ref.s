	.section .rodata.dat_sMusicProc4Script_ref, "a", %progbits
@ sMusicProc4Script: region-different data, JP 0x08577648 read from funcmap-aligned code literal (US 0x08587998); incbin baserom.gba
	.global sMusicProc4Script
sMusicProc4Script:
	.incbin "baserom.gba", 0x577648, 0x40
