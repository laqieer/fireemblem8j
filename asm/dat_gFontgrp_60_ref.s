	.section .rodata.dat_gFontgrp_60_ref, "a", %progbits
@ gFontgrp_60: region-different data, JP 0x0857be0c read from funcmap-aligned code literal (US 0x0858a8fc); incbin baserom.gba
	.global gFontgrp_60
gFontgrp_60:
	.incbin "baserom.gba", 0x57BE0C, 0x48
