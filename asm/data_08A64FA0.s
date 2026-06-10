@ data_08A64FA0: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A64FA0, "a", %progbits
	.global EventScr_Ch7_1
EventScr_Ch7_1:
	.incbin "data/residual/data_08A64FA0.bin", 0x0, 0x28

	.section .data.residue.08A64FC8, "a", %progbits
	.global EventScr_Ch7_2
EventScr_Ch7_2:
	.incbin "data/residual/data_08A64FA0.bin", 0x28, 0x28

	.section .data.residue.08A64FF0, "a", %progbits
	.global EventScr_Ch7_3
EventScr_Ch7_3:
	.incbin "data/residual/data_08A64FA0.bin", 0x50, 0x7C

