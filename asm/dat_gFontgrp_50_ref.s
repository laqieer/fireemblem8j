	.section .rodata.dat_gFontgrp_50_ref, "a", %progbits
@ gFontgrp_50: region-different data, JP 0x0857bc14 read from funcmap-aligned code literal (US 0x0858a62c); incbin baserom.gba
	.global gFontgrp_50
gFontgrp_50:
	.incbin "baserom.gba", 0x57BC14, 0x48
