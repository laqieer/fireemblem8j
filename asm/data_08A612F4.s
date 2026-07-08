@ byte-neutral SPLIT of data_08A612F4 into 5 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A612F4, "a", %progbits
	.global EventScr_Prologue_EirikaAttacked
EventScr_Prologue_EirikaAttacked:
	.incbin "data/residual/data_08A612F4.bin", 0x0, 0x58
	.section .data.residue.08A6134C, "a", %progbits
	.global EventScr_Prologue_Turn1
EventScr_Prologue_Turn1:
	.incbin "data/residual/data_08A612F4.bin", 0x58, 0x28
	.section .data.residue.08A61374, "a", %progbits
	.global EventScr_Prologue_Turn2
EventScr_Prologue_Turn2:
	.incbin "data/residual/data_08A612F4.bin", 0x80, 0x18
	.section .data.residue.08A6138C, "a", %progbits
	.global EventScr_Prologue_Turn3
EventScr_Prologue_Turn3:
	.incbin "data/residual/data_08A612F4.bin", 0x98, 0x28
	.section .data.residue.08A613B4, "a", %progbits
	.global EventScr_Prologue_ExecTut
EventScr_Prologue_ExecTut:
	.incbin "data/residual/data_08A612F4.bin", 0xC0, 0x34
