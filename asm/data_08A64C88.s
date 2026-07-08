@ byte-neutral SPLIT of data_08A64C88 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A64C88, "a", %progbits
	.global EventScr_Ch6_3
EventScr_Ch6_3:
	.incbin "data/residual/data_08A64C88.bin", 0x0, 0x20
	.section .data.residue.08A64CA8, "a", %progbits
	.global EventScr_Ch6_4
EventScr_Ch6_4:
	.incbin "data/residual/data_08A64C88.bin", 0x20, 0x18
