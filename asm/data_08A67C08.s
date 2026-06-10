@ data_08A67C08: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A67C08, "a", %progbits
	.global EventScr_Ch13A_5
EventScr_Ch13A_5:
	.incbin "data/residual/data_08A67C08.bin", 0x0, 0x18

	.section .data.residue.08A67C20, "a", %progbits
	.global EventScr_Ch13A_6
EventScr_Ch13A_6:
	.incbin "data/residual/data_08A67C08.bin", 0x18, 0x18

	.section .data.residue.08A67C38, "a", %progbits
	.global EventScr_Ch13A_7
EventScr_Ch13A_7:
	.incbin "data/residual/data_08A67C08.bin", 0x30, 0x38

	.section .data.residue.08A67C70, "a", %progbits
	.global EventScr_Ch14a_BeginningScene
EventScr_Ch14a_BeginningScene:
	.incbin "data/residual/data_08A67C08.bin", 0x68, 0x188

