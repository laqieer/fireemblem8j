@ byte-neutral SPLIT of data_08A5A9B4 into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5A9B4, "a", %progbits
	.global EventListScr_Ch2_Misc
EventListScr_Ch2_Misc:
	.incbin "data/residual/data_08A5A9B4.bin", 0x0, 0x1C
	.section .data.residue.08A5A9D0, "a", %progbits
	.global EventListScr_Ch2_SelectUnit
EventListScr_Ch2_SelectUnit:
	.incbin "data/residual/data_08A5A9B4.bin", 0x1C, 0x4
	.section .data.residue.08A5A9D4, "a", %progbits
	.global EventListScr_Ch2_SelectDestination
EventListScr_Ch2_SelectDestination:
	.incbin "data/residual/data_08A5A9B4.bin", 0x20, 0x4
	.section .data.residue.08A5A9D8, "a", %progbits
	.global EventListScr_Ch2_UnitMove
EventListScr_Ch2_UnitMove:
	.incbin "data/residual/data_08A5A9B4.bin", 0x24, 0x4
