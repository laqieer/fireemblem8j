	.section .rodata.dat_gFontgrp_40_ref, "a", %progbits
@ gFontgrp_40: region-different data, JP 0x0857baac read from funcmap-aligned code literal (US 0x0858a35c); incbin baserom.gba
	.global gFontgrp_40
gFontgrp_40:
	.incbin "baserom.gba", 0x57BAAC, 0x48
