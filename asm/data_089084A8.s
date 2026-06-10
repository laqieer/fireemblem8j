@ data_089084A8: region-different residue split into 6 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.089084A8, "a", %progbits
	.global REDA_PrologueEscapees0
REDA_PrologueEscapees0:
	.incbin "data/residual/data_089084A8.bin", 0x0, 0x10

	.section .data.residue.089084B8, "a", %progbits
	.global REDA_PrologueEscapees2
REDA_PrologueEscapees2:
	.incbin "data/residual/data_089084A8.bin", 0x10, 0x10

	.section .data.residue.089084C8, "a", %progbits
	.global REDA_PrologueEscapees4
REDA_PrologueEscapees4:
	.incbin "data/residual/data_089084A8.bin", 0x20, 0x8

	.section .data.residue.089084D0, "a", %progbits
	.global REDA_PrologueValterGroup0
REDA_PrologueValterGroup0:
	.incbin "data/residual/data_089084A8.bin", 0x28, 0x10

	.section .data.residue.089084E0, "a", %progbits
	.global REDA_PrologueValterGroup2
REDA_PrologueValterGroup2:
	.incbin "data/residual/data_089084A8.bin", 0x38, 0x8

	.section .data.residue.089084E8, "a", %progbits
	.global REDA_PrologueValterGroup3
REDA_PrologueValterGroup3:
	.incbin "data/residual/data_089084A8.bin", 0x40, 0x8

