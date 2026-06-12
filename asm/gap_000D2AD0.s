	.section .rodata.gap_000D2AD0, "a", %progbits
@ gap_000D2AD0: residual gap [0x0D2AD0,0x0D2AD8) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000D2AD0
gap_000D2AD0:
	.incbin "data/residual/gap_000D2AD0.bin"
