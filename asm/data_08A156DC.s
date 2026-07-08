@ byte-neutral SPLIT of data_08A156DC into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A156DC, "a", %progbits
	.global ProcScr_SpellAssocUnused
ProcScr_SpellAssocUnused:
	.incbin "data/residual/data_08A156DC.bin", 0x0, 0x38
	.section .data.residue.08A15714, "a", %progbits
	.global ProcScr_PoisonDmgMapEffect
ProcScr_PoisonDmgMapEffect:
	.incbin "data/residual/data_08A156DC.bin", 0x38, 0x50
