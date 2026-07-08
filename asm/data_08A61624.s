@ byte-neutral SPLIT of data_08A61624 into 6 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A61624, "a", %progbits
	.global EventScr_Prologue_Tutorial5
EventScr_Prologue_Tutorial5:
	.incbin "data/residual/data_08A61624.bin", 0x0, 0x20
	.section .data.residue.08A61644, "a", %progbits
	.global EventScr_Prologue_Tutorial6
EventScr_Prologue_Tutorial6:
	.incbin "data/residual/data_08A61624.bin", 0x20, 0x30
	.section .data.residue.08A61674, "a", %progbits
	.global EventScr_Prologue_Tutorial7
EventScr_Prologue_Tutorial7:
	.incbin "data/residual/data_08A61624.bin", 0x50, 0x30
	.section .data.residue.08A616A4, "a", %progbits
	.global EventScr_Prologue_Tutorial8
EventScr_Prologue_Tutorial8:
	.incbin "data/residual/data_08A61624.bin", 0x80, 0x3C
	.section .data.residue.08A616E0, "a", %progbits
	.global EventScr_Prologue_Tutorial9
EventScr_Prologue_Tutorial9:
	.incbin "data/residual/data_08A61624.bin", 0xBC, 0x68
	.section .data.residue.08A61748, "a", %progbits
	.global EventScr_Prologue_OneillSethBattle
EventScr_Prologue_OneillSethBattle:
	.incbin "data/residual/data_08A61624.bin", 0x124, 0x60
