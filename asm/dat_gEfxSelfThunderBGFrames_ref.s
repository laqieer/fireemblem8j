	.section .rodata.dat_gEfxSelfThunderBGFrames_ref, "a", %progbits
@ gEfxSelfThunderBGFrames: region-different data, JP 0x08855df8 read from funcmap-aligned code literal (US 0x088018a0); incbin baserom.gba
	.global gEfxSelfThunderBGFrames
gEfxSelfThunderBGFrames:
	.incbin "baserom.gba", 0x855DF8, 0x154
