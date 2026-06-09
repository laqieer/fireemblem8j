	.section .rodata.dat_gFontgrp_123_ref, "a", %progbits
@ gFontgrp_123: region-different data, JP 0x0857fa84 read from funcmap-aligned code literal (US 0x0858bab4); incbin baserom.gba
	.global gFontgrp_123
gFontgrp_123:
	.incbin "baserom.gba", 0x57FA84, 0x48
