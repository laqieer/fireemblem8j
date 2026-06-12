	.section .rodata.gap_00003080, "a", %progbits
@ gap_00003080: residual gap [0x003080,0x00309C) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_00003080
gap_00003080:
	.incbin "data/residual/gap_00003080.bin"
