	.section .rodata.gap_000BD054, "a", %progbits
@ gap_000BD054: residual gap [0x0BD054,0x0BD05C) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_000BD054
gap_000BD054:
	.incbin "data/residual/gap_000BD054.bin"
