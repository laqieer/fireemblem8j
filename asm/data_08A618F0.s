@ byte-neutral SPLIT of data_08A618F0 into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A618F0, "a", %progbits
	.global EventScr_Prologue_TutorialC
EventScr_Prologue_TutorialC:
	.incbin "data/residual/data_08A618F0.bin", 0x0, 0x10
	.section .data.residue.08A61900, "a", %progbits
	.global EventScr_Prologue_TutorialD
EventScr_Prologue_TutorialD:
	.incbin "data/residual/data_08A618F0.bin", 0x10, 0x34
	.section .data.residue.08A61934, "a", %progbits
	.global EventScr_Prologue_TutorialE
EventScr_Prologue_TutorialE:
	.incbin "data/residual/data_08A618F0.bin", 0x44, 0x2C
	.section .data.residue.08A61960, "a", %progbits
	.global EventScr_Prologue_9EF828
EventScr_Prologue_9EF828:
	.incbin "data/residual/data_08A618F0.bin", 0x70, 0x20
