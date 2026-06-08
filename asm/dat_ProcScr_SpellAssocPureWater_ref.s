	.section .rodata.dat_ProcScr_SpellAssocPureWater_ref, "a", %progbits
@ ProcScr_SpellAssocPureWater: region-different data, JP 0x08a14fe4 read from funcmap-aligned code literal (US 0x089a495c); incbin baserom.gba
	.global ProcScr_SpellAssocPureWater
ProcScr_SpellAssocPureWater:
	.incbin "baserom.gba", 0xA14FE4, 0x48
