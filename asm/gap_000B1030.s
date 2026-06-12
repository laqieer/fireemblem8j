	.section .rodata.gap_000B1030, "a", %progbits
@ gap_000B1030: residual gap [0x0B1030,0x0B1120) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000B1030
gap_000B1030:
	.incbin "data/residual/gap_000B1030.bin"
