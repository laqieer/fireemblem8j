	.section .rodata.dat_gFontgrp_192_ref, "a", %progbits
@ gFontgrp_192: region-different data, JP 0x08596a64 read from funcmap-aligned code literal (US 0x0858d21c); incbin baserom.gba
	.global gFontgrp_192
gFontgrp_192:
	.incbin "baserom.gba", 0x596A64, 0x48
