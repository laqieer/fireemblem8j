@ data_08A67B00: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A67B00, "a", %progbits
	.global EventScr_Ch13A_0
EventScr_Ch13A_0:
	.incbin "data/residual/data_08A67B00.bin", 0x0, 0x2C

	.section .data.residue.08A67B2C, "a", %progbits
	.global EventScr_Ch13A_1
EventScr_Ch13A_1:
	.incbin "data/residual/data_08A67B00.bin", 0x2C, 0x28

	.section .data.residue.08A67B54, "a", %progbits
	.global EventScr_Ch13A_2
EventScr_Ch13A_2:
	.incbin "data/residual/data_08A67B00.bin", 0x54, 0x28

