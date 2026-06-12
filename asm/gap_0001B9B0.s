	.section .rodata.gap_0001B9B0, "a", %progbits
@ gap_0001B9B0: residual gap [0x01B9B0,0x01BA20) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_0001B9B0
gap_0001B9B0:
	.incbin "data/residual/gap_0001B9B0.bin"
