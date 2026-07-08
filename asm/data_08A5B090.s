@ byte-neutral SPLIT of data_08A5B090 into 6 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5B090, "a", %progbits
	.global EventListScr_Ch8_Location
EventListScr_Ch8_Location:
	.incbin "data/residual/data_08A5B090.bin", 0x0, 0x4C
	.section .data.residue.08A5B0DC, "a", %progbits
	.global EventListScr_Ch8_Misc
EventListScr_Ch8_Misc:
	.incbin "data/residual/data_08A5B090.bin", 0x4C, 0x1C
	.section .data.residue.08A5B0F8, "a", %progbits
	.global EventListScr_Ch8_SelectUnit
EventListScr_Ch8_SelectUnit:
	.incbin "data/residual/data_08A5B090.bin", 0x68, 0x4
	.section .data.residue.08A5B0FC, "a", %progbits
	.global EventListScr_Ch8_SelectDestination
EventListScr_Ch8_SelectDestination:
	.incbin "data/residual/data_08A5B090.bin", 0x6C, 0x4
	.section .data.residue.08A5B100, "a", %progbits
	.global EventListScr_Ch8_UnitMove
EventListScr_Ch8_UnitMove:
	.incbin "data/residual/data_08A5B090.bin", 0x70, 0x4
	.section .data.residue.08A5B104, "a", %progbits
	.global EventListScr_Ch8_Tutorial
EventListScr_Ch8_Tutorial:
	.incbin "data/residual/data_08A5B090.bin", 0x74, 0x4
