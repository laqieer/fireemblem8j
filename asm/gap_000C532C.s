	.section .rodata.gap_000C532C, "a", %progbits
@ gap_000C532C: residual gap [0x0C532C,0x0C5330) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000C532C
gap_000C532C:
	.incbin "data/residual/gap_000C532C.bin"
