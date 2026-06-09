	.section .rodata.dat_LagdouRuins5MapChanges_ref, "a", %progbits
@ LagdouRuins5MapChanges: region-different data, JP 0x08a5df50 read from funcmap-aligned code literal (US 0x08a1f6c4); incbin baserom.gba
	.global LagdouRuins5MapChanges
LagdouRuins5MapChanges:
	.incbin "baserom.gba", 0xA5DF50, 0x48
