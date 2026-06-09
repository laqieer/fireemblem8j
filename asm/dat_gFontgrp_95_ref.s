	.section .rodata.dat_gFontgrp_95_ref, "a", %progbits
@ gFontgrp_95: region-different data, JP 0x0857a9cc read from funcmap-aligned code literal (US 0x0858b2d4); incbin baserom.gba
	.global gFontgrp_95
gFontgrp_95:
	.incbin "baserom.gba", 0x57A9CC, 0x48
