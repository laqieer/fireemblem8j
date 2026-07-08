@ byte-neutral SPLIT of data_08A63088 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A63088, "a", %progbits
	.global EventScr_Ch2Tutorial19
EventScr_Ch2Tutorial19:
	.incbin "data/residual/data_08A63088.bin", 0x0, 0x20
	.section .data.residue.08A630A8, "a", %progbits
	.global EventScr_Ch2Tutorial20
EventScr_Ch2Tutorial20:
	.incbin "data/residual/data_08A63088.bin", 0x20, 0x30
