	.section .rodata.dat_LagdouRuins7MapChanges_ref, "a", %progbits
@ LagdouRuins7MapChanges: region-different data, JP 0x08a5e15c read from funcmap-aligned code literal (US 0x08a1f764); incbin baserom.gba
	.global LagdouRuins7MapChanges
LagdouRuins7MapChanges:
	.incbin "baserom.gba", 0xA5E15C, 0x1A8
