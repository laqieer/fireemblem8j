@ byte-neutral SPLIT of data_08A5B238 into 5 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5B238, "a", %progbits
	.global EventListScr_Ch9a_Misc
EventListScr_Ch9a_Misc:
	.incbin "data/residual/data_08A5B238.bin", 0x0, 0x1C
	.section .data.residue.08A5B254, "a", %progbits
	.global EventListScr_Ch9a_SelectUnit
EventListScr_Ch9a_SelectUnit:
	.incbin "data/residual/data_08A5B238.bin", 0x1C, 0x4
	.section .data.residue.08A5B258, "a", %progbits
	.global EventListScr_Ch9a_SelectDestination
EventListScr_Ch9a_SelectDestination:
	.incbin "data/residual/data_08A5B238.bin", 0x20, 0x4
	.section .data.residue.08A5B25C, "a", %progbits
	.global EventListScr_Ch9a_UnitMove
EventListScr_Ch9a_UnitMove:
	.incbin "data/residual/data_08A5B238.bin", 0x24, 0x4
	.section .data.residue.08A5B260, "a", %progbits
	.global EventListScr_Ch9a_Tutorial
EventListScr_Ch9a_Tutorial:
	.incbin "data/residual/data_08A5B238.bin", 0x28, 0x4
