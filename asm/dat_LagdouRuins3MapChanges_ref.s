	.section .rodata.dat_LagdouRuins3MapChanges_ref, "a", %progbits
@ LagdouRuins3MapChanges: region-different data, JP 0x08a5ddc8 read from funcmap-aligned code literal (US 0x08a1f43c); incbin baserom.gba
	.global LagdouRuins3MapChanges
LagdouRuins3MapChanges:
	.incbin "baserom.gba", 0xA5DDC8, 0xA8
