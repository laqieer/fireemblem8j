@ byte-neutral SPLIT of data_08A5AC94 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A5AC94, "a", %progbits
	.global EventListScr_Ch5_Turn
EventListScr_Ch5_Turn:
	.incbin "data/residual/data_08A5AC94.bin", 0x0, 0x28
	.section .data.residue.08A5ACBC, "a", %progbits
	.global EventListScr_Ch5_Character
EventListScr_Ch5_Character:
	.incbin "data/residual/data_08A5AC94.bin", 0x28, 0x14
