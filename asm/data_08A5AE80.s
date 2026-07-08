@ byte-neutral SPLIT of data_08A5AE80 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5AE80, "a", %progbits
	.global EventListScr_Ch6_Turn
EventListScr_Ch6_Turn:
	.incbin "data/residual/data_08A5AE80.bin", 0x0, 0x10
	.section .data.residue.08A5AE90, "a", %progbits
	.global EventListScr_Ch6_Character
EventListScr_Ch6_Character:
	.incbin "data/residual/data_08A5AE80.bin", 0x10, 0x4
	.section .data.residue.08A5AE94, "a", %progbits
	.global EventListScr_Ch6_Location
EventListScr_Ch6_Location:
	.incbin "data/residual/data_08A5AE80.bin", 0x14, 0x1C
	.section .data.residue.08A5AEB0, "a", %progbits
	.global EventListScr_Ch6_Misc
EventListScr_Ch6_Misc:
	.incbin "data/residual/data_08A5AE80.bin", 0x30, 0x28
	.section .data.residue.08A5AED8, "a", %progbits
	.global EventListScr_Ch6_SelectUnit
EventListScr_Ch6_SelectUnit:
	.incbin "data/residual/data_08A5AE80.bin", 0x58, 0x4
	.section .data.residue.08A5AEDC, "a", %progbits
	.global EventListScr_Ch6_SelectDestination
EventListScr_Ch6_SelectDestination:
	.incbin "data/residual/data_08A5AE80.bin", 0x5C, 0x4
	.section .data.residue.08A5AEE0, "a", %progbits
	.global EventListScr_Ch6_UnitMove
EventListScr_Ch6_UnitMove:
	.incbin "data/residual/data_08A5AE80.bin", 0x60, 0x4
	.section .data.residue.08A5AEE4, "a", %progbits
	.global EventListScr_Ch6_Tutorial
EventListScr_Ch6_Tutorial:
	.incbin "data/residual/data_08A5AE80.bin", 0x64, 0x4
