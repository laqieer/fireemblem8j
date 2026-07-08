@ byte-neutral SPLIT of data_08A60BE4 into 3 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A60BE4, "a", %progbits
	.global EventScr_9EEAAC
EventScr_9EEAAC:
	.incbin "data/residual/data_08A60BE4.bin", 0x0, 0x54
	.section .data.residue.08A60C38, "a", %progbits
	.global EventScr_9EEB00
EventScr_9EEB00:
	.incbin "data/residual/data_08A60BE4.bin", 0x54, 0xB8
	.section .data.residue.08A60CF0, "a", %progbits
	.global EventScr_CallBreakStone
EventScr_CallBreakStone:
	.incbin "data/residual/data_08A60BE4.bin", 0x10C, 0x30
