	.section .rodata.dat_UnitDef_Event_PrologueEscapees_ref, "a", %progbits
@ UnitDef_Event_PrologueEscapees: region-different data, JP 0x089084f0 read from funcmap-aligned code literal (US 0x088b3f68); incbin baserom.gba
	.global UnitDef_Event_PrologueEscapees
UnitDef_Event_PrologueEscapees:
	.incbin "baserom.gba", 0x9084F0, 0x50
