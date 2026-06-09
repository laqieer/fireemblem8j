	.section .rodata.dat_gFontgrp_32_ref, "a", %progbits
@ gFontgrp_32: region-different data, JP 0x0857c3ac read from funcmap-aligned code literal (US 0x0858a11c); incbin baserom.gba
	.global gFontgrp_32
gFontgrp_32:
	.incbin "baserom.gba", 0x57C3AC, 0x48
