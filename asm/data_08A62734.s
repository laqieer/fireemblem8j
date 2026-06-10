@ data_08A62734: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62734, "a", %progbits
	.global EventScr_Ch2_Talk_EirikaRoss
EventScr_Ch2_Talk_EirikaRoss:
	.incbin "data/residual/data_08A62734.bin", 0x0, 0x2C

	.section .data.residue.08A62760, "a", %progbits
	.global EventScr_Ch2_Talk_RossGarcia
EventScr_Ch2_Talk_RossGarcia:
	.incbin "data/residual/data_08A62734.bin", 0x2C, 0x28

