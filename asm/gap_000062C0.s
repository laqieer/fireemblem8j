	.section .rodata.gap_000062C0, "a", %progbits
@ gap_000062C0: residual gap [0x0062C0,0x0062C8) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000062C0
gap_000062C0:
	.incbin "data/residual/gap_000062C0.bin"
