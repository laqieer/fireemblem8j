	.section .rodata.dat_gFontgrp_20_ref, "a", %progbits
@ gFontgrp_20: region-different data, JP 0x0857b794 read from funcmap-aligned code literal (US 0x08589dbc); incbin baserom.gba
	.global gFontgrp_20
gFontgrp_20:
	.incbin "baserom.gba", 0x57B794, 0x48
