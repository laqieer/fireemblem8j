	.section .rodata.gap_000BD0C8, "a", %progbits
@ gap_000BD0C8: residual gap [0x0BD0C8,0x0BD0CC) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000BD0C8
gap_000BD0C8:
	.incbin "data/residual/gap_000BD0C8.bin"
