	.section .rodata.dat_gFontgrp_240_ref, "a", %progbits
@ gFontgrp_240: region-different data, JP 0x08595744 read from funcmap-aligned code literal (US 0x0858df9c); incbin baserom.gba
	.global gFontgrp_240
gFontgrp_240:
	.incbin "baserom.gba", 0x595744, 0x48
