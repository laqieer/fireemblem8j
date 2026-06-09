	.section .rodata.dat_gFontgrp_200_ref, "a", %progbits
@ gFontgrp_200: region-different data, JP 0x08596164 read from funcmap-aligned code literal (US 0x0858d45c); incbin baserom.gba
	.global gFontgrp_200
gFontgrp_200:
	.incbin "baserom.gba", 0x596164, 0x48
