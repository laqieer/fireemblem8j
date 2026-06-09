	.section .rodata.dat_gFontgrp_250_ref, "a", %progbits
@ gFontgrp_250: region-different data, JP 0x085944b4 read from funcmap-aligned code literal (US 0x0858e26c); incbin baserom.gba
	.global gFontgrp_250
gFontgrp_250:
	.incbin "baserom.gba", 0x5944B4, 0x48
