@ byte-neutral partial SPLIT of EventListScr_Ch20b_Character: LEAVE prefix + 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5D524, "a", %progbits
	.global EventListScr_Ch20b_Character
EventListScr_Ch20b_Character:
	.incbin "data/residual/data_08A5D524.bin", 0x0, 0x3C
	.section .data.residue.08A5D560, "a", %progbits
	.global EventListScr_Ch20b_SelectUnit
EventListScr_Ch20b_SelectUnit:
	.incbin "data/residual/data_08A5D524.bin", 0x3C, 0x4
	.section .data.residue.08A5D564, "a", %progbits
	.global EventListScr_Ch20b_SelectDestination
EventListScr_Ch20b_SelectDestination:
	.incbin "data/residual/data_08A5D524.bin", 0x40, 0x4
	.section .data.residue.08A5D568, "a", %progbits
	.global EventListScr_Ch20b_UnitMove
EventListScr_Ch20b_UnitMove:
	.incbin "data/residual/data_08A5D524.bin", 0x44, 0x4
	.section .data.residue.08A5D56C, "a", %progbits
	.global EventListScr_Ch20b_Tutorial
EventListScr_Ch20b_Tutorial:
	.incbin "data/residual/data_08A5D524.bin", 0x48, 0x4
