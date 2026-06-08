	.section .rodata.dat_LagdouRuins2MapChanges_ref, "a", %progbits
@ LagdouRuins2MapChanges: region-different data, JP 0x08a5dca4 read from funcmap-aligned code literal (US 0x08a1f3e8); incbin baserom.gba
	.global LagdouRuins2MapChanges
LagdouRuins2MapChanges:
	.incbin "baserom.gba", 0xA5DCA4, 0x124
