@ byte-neutral SPLIT of data_08A5CFA0 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5CFA0, "a", %progbits
	.global EventListScr_Ch16b_Turn
EventListScr_Ch16b_Turn:
	.incbin "data/residual/data_08A5CFA0.bin", 0x0, 0xAC
	.section .data.residue.08A5D04C, "a", %progbits
	.global EventListScr_Ch16b_Character
EventListScr_Ch16b_Character:
	.incbin "data/residual/data_08A5CFA0.bin", 0xAC, 0x34
