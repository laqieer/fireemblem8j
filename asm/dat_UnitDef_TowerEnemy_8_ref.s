	.section .rodata.dat_UnitDef_TowerEnemy_8_ref, "a", %progbits
@ UnitDef_TowerEnemy_8: region-different data, JP 0x08920ec0 read from funcmap-aligned code literal (US 0x088cca6c); incbin baserom.gba
	.global UnitDef_TowerEnemy_8
UnitDef_TowerEnemy_8:
	.incbin "baserom.gba", 0x920EC0, 0x280
