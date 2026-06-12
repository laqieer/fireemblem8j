	.section .rodata.gap_000BBA3C, "a", %progbits
@ gap_000BBA3C: residual gap [0x0BBA3C,0x0BBC98) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000BBA3C
gap_000BBA3C:
	.incbin "data/residual/gap_000BBA3C.bin"
