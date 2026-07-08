@ byte-neutral SPLIT of data_08A5ADC8 into 8 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5ADC8, "a", %progbits
	.global EventListScr_Ch5x_Turn
EventListScr_Ch5x_Turn:
	.incbin "data/residual/data_08A5ADC8.bin", 0x0, 0x4
	.section .data.residue.08A5ADCC, "a", %progbits
	.global EventListScr_Ch5x_Character
EventListScr_Ch5x_Character:
	.incbin "data/residual/data_08A5ADC8.bin", 0x4, 0x4
	.section .data.residue.08A5ADD0, "a", %progbits
	.global EventListScr_Ch5x_Location
EventListScr_Ch5x_Location:
	.incbin "data/residual/data_08A5ADC8.bin", 0x8, 0x40
	.section .data.residue.08A5AE10, "a", %progbits
	.global EventListScr_Ch5x_Misc
EventListScr_Ch5x_Misc:
	.incbin "data/residual/data_08A5ADC8.bin", 0x48, 0x10
	.section .data.residue.08A5AE20, "a", %progbits
	.global EventListScr_Ch5x_SelectUnit
EventListScr_Ch5x_SelectUnit:
	.incbin "data/residual/data_08A5ADC8.bin", 0x58, 0x4
	.section .data.residue.08A5AE24, "a", %progbits
	.global EventListScr_Ch5x_SelectDestination
EventListScr_Ch5x_SelectDestination:
	.incbin "data/residual/data_08A5ADC8.bin", 0x5C, 0x4
	.section .data.residue.08A5AE28, "a", %progbits
	.global EventListScr_Ch5x_UnitMove
EventListScr_Ch5x_UnitMove:
	.incbin "data/residual/data_08A5ADC8.bin", 0x60, 0x4
	.section .data.residue.08A5AE2C, "a", %progbits
	.global EventListScr_Ch5x_Tutorial
EventListScr_Ch5x_Tutorial:
	.incbin "data/residual/data_08A5ADC8.bin", 0x64, 0x4
