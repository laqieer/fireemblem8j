@ byte-neutral SPLIT of data_08A5D5C0 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5D5C0, "a", %progbits
	.global EventListScr_Ch21b_Turn
EventListScr_Ch21b_Turn:
	.incbin "data/residual/data_08A5D5C0.bin", 0x0, 0x4
	.section .data.residue.08A5D5C4, "a", %progbits
	.global EventListScr_Ch21b_Character
EventListScr_Ch21b_Character:
	.incbin "data/residual/data_08A5D5C0.bin", 0x4, 0x4
	.section .data.residue.08A5D5C8, "a", %progbits
	.global EventListScr_Ch21b_Location
EventListScr_Ch21b_Location:
	.incbin "data/residual/data_08A5D5C0.bin", 0x8, 0x4
	.section .data.residue.08A5D5CC, "a", %progbits
	.global EventListScr_Ch21b_Misc
EventListScr_Ch21b_Misc:
	.incbin "data/residual/data_08A5D5C0.bin", 0xC, 0x1C
	.section .data.residue.08A5D5E8, "a", %progbits
	.global EventListScr_Ch21b_SelectUnit
EventListScr_Ch21b_SelectUnit:
	.incbin "data/residual/data_08A5D5C0.bin", 0x28, 0x4
	.section .data.residue.08A5D5EC, "a", %progbits
	.global EventListScr_Ch21b_SelectDestination
EventListScr_Ch21b_SelectDestination:
	.incbin "data/residual/data_08A5D5C0.bin", 0x2C, 0x4
	.section .data.residue.08A5D5F0, "a", %progbits
	.global EventListScr_Ch21b_UnitMove
EventListScr_Ch21b_UnitMove:
	.incbin "data/residual/data_08A5D5C0.bin", 0x30, 0x4
	.section .data.residue.08A5D5F4, "a", %progbits
	.global EventListScr_Ch21b_Tutorial
EventListScr_Ch21b_Tutorial:
	.incbin "data/residual/data_08A5D5C0.bin", 0x34, 0x4
