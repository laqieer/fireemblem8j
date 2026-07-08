@ byte-neutral SPLIT of data_08A6378C into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A6378C, "a", %progbits
	.global EventScr_Ch3_1
EventScr_Ch3_1:
	.incbin "data/residual/data_08A6378C.bin", 0x0, 0x38
	.section .data.residue.08A637C4, "a", %progbits
	.global EventScr_Ch3_2
EventScr_Ch3_2:
	.incbin "data/residual/data_08A6378C.bin", 0x38, 0x20
	.section .data.residue.08A637E4, "a", %progbits
	.global EventScr_Ch3_3
EventScr_Ch3_3:
	.incbin "data/residual/data_08A6378C.bin", 0x58, 0x1C
	.section .data.residue.08A63800, "a", %progbits
	.global EventScr_Ch3_4
EventScr_Ch3_4:
	.incbin "data/residual/data_08A6378C.bin", 0x74, 0x20
