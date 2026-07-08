@ byte-neutral SPLIT of data_08A5A910 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5A910, "a", %progbits
	.global EventListScr_Ch2_Turn
EventListScr_Ch2_Turn:
	.incbin "data/residual/data_08A5A910.bin", 0x0, 0x28
	.section .data.residue.08A5A938, "a", %progbits
	.global EventListScr_Ch2_Character
EventListScr_Ch2_Character:
	.incbin "data/residual/data_08A5A910.bin", 0x28, 0x24
