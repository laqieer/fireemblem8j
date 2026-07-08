@ byte-neutral SPLIT of data_08A5D0E4 (8B all-NULL) into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5D0E4, "a", %progbits
	.global EventListScr_Ch16b_UnitMove
EventListScr_Ch16b_UnitMove:
	.incbin "data/residual/data_08A5D0E4.bin", 0x0, 0x4
	.section .data.residue.08A5D0E8, "a", %progbits
	.global EventListScr_Ch16b_Tutorial
EventListScr_Ch16b_Tutorial:
	.incbin "data/residual/data_08A5D0E4.bin", 0x4, 0x4
