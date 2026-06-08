	.section .rodata.dat_LagdouRuins6MapChanges_ref, "a", %progbits
@ LagdouRuins6MapChanges: region-different data, JP 0x08a5e038 read from funcmap-aligned code literal (US 0x08a1f71c); incbin baserom.gba
	.global LagdouRuins6MapChanges
LagdouRuins6MapChanges:
	.incbin "baserom.gba", 0xA5E038, 0x124
