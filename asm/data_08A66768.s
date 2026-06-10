@ data_08A66768: region-different residue split into 7 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A66768, "a", %progbits
	.global EventScr_Ch10A_1
EventScr_Ch10A_1:
	.incbin "data/residual/data_08A66768.bin", 0x0, 0x28

	.section .data.residue.08A66790, "a", %progbits
	.global EventScr_Ch10A_2
EventScr_Ch10A_2:
	.incbin "data/residual/data_08A66768.bin", 0x28, 0x28

	.section .data.residue.08A667B8, "a", %progbits
	.global EventScr_Ch10A_3
EventScr_Ch10A_3:
	.incbin "data/residual/data_08A66768.bin", 0x50, 0x28

	.section .data.residue.08A667E0, "a", %progbits
	.global EventScr_Ch10A_4
EventScr_Ch10A_4:
	.incbin "data/residual/data_08A66768.bin", 0x78, 0x28

	.section .data.residue.08A66808, "a", %progbits
	.global EventScr_Ch10A_5
EventScr_Ch10A_5:
	.incbin "data/residual/data_08A66768.bin", 0xA0, 0x28

	.section .data.residue.08A66830, "a", %progbits
	.global EventScr_Ch10A_6
EventScr_Ch10A_6:
	.incbin "data/residual/data_08A66768.bin", 0xC8, 0x28

	.section .data.residue.08A66858, "a", %progbits
	.global EventScr_Ch10A_7
EventScr_Ch10A_7:
	.incbin "data/residual/data_08A66768.bin", 0xF0, 0x2C

