@ data_08A157AC: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A157AC, "a", %progbits
	.global ProcScr_EggDmgMapEffect2
ProcScr_EggDmgMapEffect2:
	.incbin "data/residual/data_08A157AC.bin", 0x0, 0x30

	.section .data.residue.08A157DC, "a", %progbits
	.global ProcScr_CritAtkMapEffect
ProcScr_CritAtkMapEffect:
	.incbin "data/residual/data_08A157AC.bin", 0x30, 0x38

