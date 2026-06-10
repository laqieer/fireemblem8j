@ data_08A642F0: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A642F0, "a", %progbits
	.global EventScr_Ch5_1
EventScr_Ch5_1:
	.incbin "data/residual/data_08A642F0.bin", 0x0, 0x3C

	.section .data.residue.08A6432C, "a", %progbits
	.global EventScr_Ch5_2
EventScr_Ch5_2:
	.incbin "data/residual/data_08A642F0.bin", 0x3C, 0x3C

	.section .data.residue.08A64368, "a", %progbits
	.global EventScr_Ch5_3
EventScr_Ch5_3:
	.incbin "data/residual/data_08A642F0.bin", 0x78, 0x3C

	.section .data.residue.08A643A4, "a", %progbits
	.global EventScr_Ch5_4
EventScr_Ch5_4:
	.incbin "data/residual/data_08A642F0.bin", 0xB4, 0x34

