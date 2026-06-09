	.section .rodata.dat_gFontgrp_201_ref, "a", %progbits
@ gFontgrp_201: region-different data, JP 0x085961ac read from funcmap-aligned code literal (US 0x0858d4a4); incbin baserom.gba
	.global gFontgrp_201
gFontgrp_201:
	.incbin "baserom.gba", 0x5961AC, 0x48
