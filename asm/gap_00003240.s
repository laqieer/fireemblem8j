	.section .rodata.gap_00003240, "a", %progbits
@ gap_00003240: residual gap [0x003240,0x003244) carved to committed
@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)
	.global gap_00003240
gap_00003240:
	.incbin "data/residual/gap_00003240.bin"
