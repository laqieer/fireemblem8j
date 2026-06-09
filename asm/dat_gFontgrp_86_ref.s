	.section .rodata.dat_gFontgrp_86_ref, "a", %progbits
@ gFontgrp_86: region-different data, JP 0x0857b11c read from funcmap-aligned code literal (US 0x0858b04c); incbin baserom.gba
	.global gFontgrp_86
gFontgrp_86:
	.incbin "baserom.gba", 0x57B11C, 0x48
