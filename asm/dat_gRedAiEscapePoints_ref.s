	.section .rodata.dat_gRedAiEscapePoints_ref, "a", %progbits
@ gRedAiEscapePoints: region-different data, JP 0x085d2090 read from funcmap-aligned code literal (US 0x085a8188); incbin baserom.gba
	.global gRedAiEscapePoints
gRedAiEscapePoints:
	.incbin "baserom.gba", 0x5D2090, 0x104
