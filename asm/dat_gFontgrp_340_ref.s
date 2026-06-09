	.section .rodata.dat_gFontgrp_340_ref, "a", %progbits
@ gFontgrp_340: region-different data, JP 0x0857cb8c read from funcmap-aligned code literal (US 0x0858ffbc); incbin baserom.gba
	.global gFontgrp_340
gFontgrp_340:
	.incbin "baserom.gba", 0x57CB8C, 0x48
