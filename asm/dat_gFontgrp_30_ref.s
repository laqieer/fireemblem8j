	.section .rodata.dat_gFontgrp_30_ref, "a", %progbits
@ gFontgrp_30: region-different data, JP 0x0857b98c read from funcmap-aligned code literal (US 0x0858a08c); incbin baserom.gba
	.global gFontgrp_30
gFontgrp_30:
	.incbin "baserom.gba", 0x57B98C, 0x48
