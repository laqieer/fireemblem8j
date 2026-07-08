@ byte-neutral SPLIT of data_08A5AAA8 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5AAA8, "a", %progbits
	.global EventListScr_Ch3_Turn
EventListScr_Ch3_Turn:
	.incbin "data/residual/data_08A5AAA8.bin", 0x0, 0x1C
	.section .data.residue.08A5AAC4, "a", %progbits
	.global EventListScr_Ch3_Character
EventListScr_Ch3_Character:
	.incbin "data/residual/data_08A5AAA8.bin", 0x1C, 0x14
	.section .data.residue.08A5AAD8, "a", %progbits
	.global EventListScr_Ch3_Location
EventListScr_Ch3_Location:
	.incbin "data/residual/data_08A5AAA8.bin", 0x30, 0x64
	.section .data.residue.08A5AB3C, "a", %progbits
	.global EventListScr_Ch3_Misc
EventListScr_Ch3_Misc:
	.incbin "data/residual/data_08A5AAA8.bin", 0x94, 0x10
	.section .data.residue.08A5AB4C, "a", %progbits
	.global EventListScr_Ch3_SelectUnit
EventListScr_Ch3_SelectUnit:
	.incbin "data/residual/data_08A5AAA8.bin", 0xA4, 0x4
	.section .data.residue.08A5AB50, "a", %progbits
	.global EventListScr_Ch3_SelectDestination
EventListScr_Ch3_SelectDestination:
	.incbin "data/residual/data_08A5AAA8.bin", 0xA8, 0x4
	.section .data.residue.08A5AB54, "a", %progbits
	.global EventListScr_Ch3_UnitMove
EventListScr_Ch3_UnitMove:
	.incbin "data/residual/data_08A5AAA8.bin", 0xAC, 0x4
	.section .data.residue.08A5AB58, "a", %progbits
	.global EventListScr_Ch3_Tutorials
EventListScr_Ch3_Tutorials:
	.incbin "data/residual/data_08A5AAA8.bin", 0xB0, 0x4
