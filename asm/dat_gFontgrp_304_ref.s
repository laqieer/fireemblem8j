	.section .rodata.dat_gFontgrp_304_ref, "a", %progbits
@ gFontgrp_304: region-different data, JP 0x08599b9c read from funcmap-aligned code literal (US 0x0858f19c); incbin baserom.gba
	.global gFontgrp_304
gFontgrp_304:
	.incbin "baserom.gba", 0x599B9C, 0x48
