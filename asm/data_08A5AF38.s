@ byte-neutral SPLIT of data_08A5AF38 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5AF38, "a", %progbits
	.global EventListScr_Ch7_Turn
EventListScr_Ch7_Turn:
	.incbin "data/residual/data_08A5AF38.bin", 0x0, 0x10
	.section .data.residue.08A5AF48, "a", %progbits
	.global EventListScr_Ch7_Character
EventListScr_Ch7_Character:
	.incbin "data/residual/data_08A5AF38.bin", 0x10, 0x4
	.section .data.residue.08A5AF4C, "a", %progbits
	.global EventListScr_Ch7_Location
EventListScr_Ch7_Location:
	.incbin "data/residual/data_08A5AF38.bin", 0x14, 0x28
	.section .data.residue.08A5AF74, "a", %progbits
	.global EventListScr_Ch7_Misc
EventListScr_Ch7_Misc:
	.incbin "data/residual/data_08A5AF38.bin", 0x3C, 0x10
	.section .data.residue.08A5AF84, "a", %progbits
	.global EventListScr_Ch7_SelectUnit
EventListScr_Ch7_SelectUnit:
	.incbin "data/residual/data_08A5AF38.bin", 0x4C, 0x4
	.section .data.residue.08A5AF88, "a", %progbits
	.global EventListScr_Ch7_SelectDestination
EventListScr_Ch7_SelectDestination:
	.incbin "data/residual/data_08A5AF38.bin", 0x50, 0x4
	.section .data.residue.08A5AF8C, "a", %progbits
	.global EventListScr_Ch7_UnitMove
EventListScr_Ch7_UnitMove:
	.incbin "data/residual/data_08A5AF38.bin", 0x54, 0x4
	.section .data.residue.08A5AF90, "a", %progbits
	.global EventListScr_Ch7_Tutorial
EventListScr_Ch7_Tutorial:
	.incbin "data/residual/data_08A5AF38.bin", 0x58, 0x4
