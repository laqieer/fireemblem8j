	.section .rodata.dat_TowerOfValni6MapChanges_ref, "a", %progbits
@ TowerOfValni6MapChanges: region-different data, JP 0x08a5d9b8 read from funcmap-aligned code literal (US 0x08a1f20c); incbin baserom.gba
	.global TowerOfValni6MapChanges
TowerOfValni6MapChanges:
	.incbin "baserom.gba", 0xA5D9B8, 0xD8
