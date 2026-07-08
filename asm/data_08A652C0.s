@ byte-neutral RENAME of data_08A652C0 -> EventScr_Ch8_EndingScene (whole object, single section).
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A652C0, "a", %progbits
	.global EventScr_Ch8_EndingScene
EventScr_Ch8_EndingScene:
	.incbin "data/residual/data_08A652C0.bin", 0x0, 0xF4
