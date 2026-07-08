@ byte-neutral SPLIT of data_08A614C0 into 3 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A614C0, "a", %progbits
	.global EventScr_Prologue_Tutorial2
EventScr_Prologue_Tutorial2:
	.incbin "data/residual/data_08A614C0.bin", 0x0, 0x10
	.section .data.residue.08A614D0, "a", %progbits
	.global EventScr_Prologue_Tutorial3
EventScr_Prologue_Tutorial3:
	.incbin "data/residual/data_08A614C0.bin", 0x10, 0x1C
	.section .data.residue.08A614EC, "a", %progbits
	.global EventScr_Prologue_TutMessageTurn1
EventScr_Prologue_TutMessageTurn1:
	.incbin "data/residual/data_08A614C0.bin", 0x2C, 0x24
