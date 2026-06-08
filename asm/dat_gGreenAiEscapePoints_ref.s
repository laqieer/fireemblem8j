	.section .rodata.dat_gGreenAiEscapePoints_ref, "a", %progbits
@ gGreenAiEscapePoints: region-different data, JP 0x085d2194 read from funcmap-aligned code literal (US 0x085a828c); incbin baserom.gba
	.global gGreenAiEscapePoints
gGreenAiEscapePoints:
	.incbin "baserom.gba", 0x5D2194, 0x104
