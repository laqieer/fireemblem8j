@ byte-neutral SPLIT of data_08A5A828 into 6 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5A828, "a", %progbits
	.global EventListScr_Ch1_Location
EventListScr_Ch1_Location:
	.incbin "data/residual/data_08A5A828.bin", 0x0, 0x28
	.section .data.residue.08A5A850, "a", %progbits
	.global EventListScr_Ch1_Misc
EventListScr_Ch1_Misc:
	.incbin "data/residual/data_08A5A828.bin", 0x28, 0x28
	.section .data.residue.08A5A878, "a", %progbits
	.global EventListScr_Ch1_SelectUnit
EventListScr_Ch1_SelectUnit:
	.incbin "data/residual/data_08A5A828.bin", 0x50, 0x4
	.section .data.residue.08A5A87C, "a", %progbits
	.global EventListScr_Ch1_SelectDestination
EventListScr_Ch1_SelectDestination:
	.incbin "data/residual/data_08A5A828.bin", 0x54, 0x4
	.section .data.residue.08A5A880, "a", %progbits
	.global EventListScr_Ch1_UnitMove
EventListScr_Ch1_UnitMove:
	.incbin "data/residual/data_08A5A828.bin", 0x58, 0x4
	.section .data.residue.08A5A884, "a", %progbits
	.global EventListScr_Ch1_Tutorial
EventListScr_Ch1_Tutorial:
	.incbin "data/residual/data_08A5A828.bin", 0x5C, 0x3C
