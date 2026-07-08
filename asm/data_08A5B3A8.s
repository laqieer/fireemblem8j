@ byte-neutral SPLIT of data_08A5B3A8 into 5 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5B3A8, "a", %progbits
	.global EventListScr_Ch10a_Misc
EventListScr_Ch10a_Misc:
	.incbin "data/residual/data_08A5B3A8.bin", 0x0, 0x1C
	.section .data.residue.08A5B3C4, "a", %progbits
	.global EventListScr_Ch10a_SelectUnit
EventListScr_Ch10a_SelectUnit:
	.incbin "data/residual/data_08A5B3A8.bin", 0x1C, 0x4
	.section .data.residue.08A5B3C8, "a", %progbits
	.global EventListScr_Ch10a_SelectDestination
EventListScr_Ch10a_SelectDestination:
	.incbin "data/residual/data_08A5B3A8.bin", 0x20, 0x4
	.section .data.residue.08A5B3CC, "a", %progbits
	.global EventListScr_Ch10a_UnitMove
EventListScr_Ch10a_UnitMove:
	.incbin "data/residual/data_08A5B3A8.bin", 0x24, 0x4
	.section .data.residue.08A5B3D0, "a", %progbits
	.global EventListScr_Ch10a_Tutorial
EventListScr_Ch10a_Tutorial:
	.incbin "data/residual/data_08A5B3A8.bin", 0x28, 0x4
