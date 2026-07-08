@ byte-neutral SPLIT of data_08A5ABAC into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5ABAC, "a", %progbits
	.global EventListScr_Ch4_Turn
EventListScr_Ch4_Turn:
	.incbin "data/residual/data_08A5ABAC.bin", 0x0, 0x28
	.section .data.residue.08A5ABD4, "a", %progbits
	.global EventListScr_Ch4_Character
EventListScr_Ch4_Character:
	.incbin "data/residual/data_08A5ABAC.bin", 0x28, 0x4
	.section .data.residue.08A5ABD8, "a", %progbits
	.global EventListScr_Ch4_Location
EventListScr_Ch4_Location:
	.incbin "data/residual/data_08A5ABAC.bin", 0x2C, 0x34
	.section .data.residue.08A5AC0C, "a", %progbits
	.global EventListScr_Ch4_Misc
EventListScr_Ch4_Misc:
	.incbin "data/residual/data_08A5ABAC.bin", 0x60, 0x28
	.section .data.residue.08A5AC34, "a", %progbits
	.global EventListScr_Ch4_SelectUnit
EventListScr_Ch4_SelectUnit:
	.incbin "data/residual/data_08A5ABAC.bin", 0x88, 0x4
	.section .data.residue.08A5AC38, "a", %progbits
	.global EventListScr_Ch4_SelectDestination
EventListScr_Ch4_SelectDestination:
	.incbin "data/residual/data_08A5ABAC.bin", 0x8C, 0x4
	.section .data.residue.08A5AC3C, "a", %progbits
	.global EventListScr_Ch4_UnitMove
EventListScr_Ch4_UnitMove:
	.incbin "data/residual/data_08A5ABAC.bin", 0x90, 0x4
	.section .data.residue.08A5AC40, "a", %progbits
	.global EventListScr_Ch4_Tutorial
EventListScr_Ch4_Tutorial:
	.incbin "data/residual/data_08A5ABAC.bin", 0x94, 0x4
