@ byte-neutral partial SPLIT of data_08A5D40C: LEAVE prefix + 5 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5D40C, "a", %progbits
	.global data_08A5D40C
data_08A5D40C:
	.incbin "data/residual/data_08A5D40C.bin", 0x0, 0x8
	.section .data.residue.08A5D414, "a", %progbits
	.global EventListScr_Ch19b_Misc
EventListScr_Ch19b_Misc:
	.incbin "data/residual/data_08A5D40C.bin", 0x8, 0x40
	.section .data.residue.08A5D454, "a", %progbits
	.global EventListScr_Ch19b_SelectUnit
EventListScr_Ch19b_SelectUnit:
	.incbin "data/residual/data_08A5D40C.bin", 0x48, 0x4
	.section .data.residue.08A5D458, "a", %progbits
	.global EventListScr_Ch19b_SelectDestination
EventListScr_Ch19b_SelectDestination:
	.incbin "data/residual/data_08A5D40C.bin", 0x4C, 0x4
	.section .data.residue.08A5D45C, "a", %progbits
	.global EventListScr_Ch19b_UnitMove
EventListScr_Ch19b_UnitMove:
	.incbin "data/residual/data_08A5D40C.bin", 0x50, 0x4
	.section .data.residue.08A5D460, "a", %progbits
	.global EventListScr_Ch19b_Tutorial
EventListScr_Ch19b_Tutorial:
	.incbin "data/residual/data_08A5D40C.bin", 0x54, 0x4
