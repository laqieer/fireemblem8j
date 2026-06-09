	.section .rodata.dat_gFontgrp_220_ref, "a", %progbits
@ gFontgrp_220: region-different data, JP 0x0859851c read from funcmap-aligned code literal (US 0x0858d9fc); incbin baserom.gba
	.global gFontgrp_220
gFontgrp_220:
	.incbin "baserom.gba", 0x59851C, 0x48
