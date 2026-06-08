	.section .rodata.dat_gMPlayJumpTableTemplate_ref, "a", %progbits
@ gMPlayJumpTableTemplate: region-different data, JP 0x081f6e40 read from funcmap-aligned code literal (US 0x08207190); incbin baserom.gba
	.global gMPlayJumpTableTemplate
gMPlayJumpTableTemplate:
	.incbin "baserom.gba", 0x1F6E40, 0x90
