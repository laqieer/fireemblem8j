@ byte-neutral SPLIT of data_08A5AD4C into 5 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5AD4C, "a", %progbits
	.global EventListScr_Ch5_Misc
EventListScr_Ch5_Misc:
	.incbin "data/residual/data_08A5AD4C.bin", 0x0, 0x1C
	.section .data.residue.08A5AD68, "a", %progbits
	.global EventListScr_Ch5_SelectUnit
EventListScr_Ch5_SelectUnit:
	.incbin "data/residual/data_08A5AD4C.bin", 0x1C, 0x4
	.section .data.residue.08A5AD6C, "a", %progbits
	.global EventListScr_Ch5_SelectDestination
EventListScr_Ch5_SelectDestination:
	.incbin "data/residual/data_08A5AD4C.bin", 0x20, 0x4
	.section .data.residue.08A5AD70, "a", %progbits
	.global EventListScr_Ch5_UnitMove
EventListScr_Ch5_UnitMove:
	.incbin "data/residual/data_08A5AD4C.bin", 0x24, 0x4
	.section .data.residue.08A5AD74, "a", %progbits
	.global EventListScr_Ch5_Tutorial
EventListScr_Ch5_Tutorial:
	.incbin "data/residual/data_08A5AD4C.bin", 0x28, 0x4
