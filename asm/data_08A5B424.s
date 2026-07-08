@ byte-neutral SPLIT of data_08A5B424 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5B424, "a", %progbits
	.global EventListScr_Ch11a_Turn
EventListScr_Ch11a_Turn:
	.incbin "data/residual/data_08A5B424.bin", 0x0, 0x34
	.section .data.residue.08A5B458, "a", %progbits
	.global EventListScr_Ch11a_Character
EventListScr_Ch11a_Character:
	.incbin "data/residual/data_08A5B424.bin", 0x34, 0x24
	.section .data.residue.08A5B47C, "a", %progbits
	.global EventListScr_Ch11a_Location
EventListScr_Ch11a_Location:
	.incbin "data/residual/data_08A5B424.bin", 0x58, 0x4C
	.section .data.residue.08A5B4C8, "a", %progbits
	.global EventListScr_Ch11a_Misc
EventListScr_Ch11a_Misc:
	.incbin "data/residual/data_08A5B424.bin", 0xA4, 0x4C
	.section .data.residue.08A5B514, "a", %progbits
	.global EventListScr_Ch11a_SelectUnit
EventListScr_Ch11a_SelectUnit:
	.incbin "data/residual/data_08A5B424.bin", 0xF0, 0x4
	.section .data.residue.08A5B518, "a", %progbits
	.global EventListScr_Ch11a_SelectDestination
EventListScr_Ch11a_SelectDestination:
	.incbin "data/residual/data_08A5B424.bin", 0xF4, 0x4
	.section .data.residue.08A5B51C, "a", %progbits
	.global EventListScr_Ch11a_UnitMove
EventListScr_Ch11a_UnitMove:
	.incbin "data/residual/data_08A5B424.bin", 0xF8, 0x4
	.section .data.residue.08A5B520, "a", %progbits
	.global EventListScr_Ch11a_Tutorial
EventListScr_Ch11a_Tutorial:
	.incbin "data/residual/data_08A5B424.bin", 0xFC, 0x4
