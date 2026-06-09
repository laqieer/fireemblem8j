	.section .rodata.dat_LagdouRuins8MapChanges_ref, "a", %progbits
@ LagdouRuins8MapChanges: region-different data, JP 0x08a5e304 read from funcmap-aligned code literal (US 0x08a1f830); incbin baserom.gba
	.global LagdouRuins8MapChanges
LagdouRuins8MapChanges:
	.incbin "baserom.gba", 0xA5E304, 0xB4
