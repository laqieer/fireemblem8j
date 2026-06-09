	.section .rodata.dat_gFontgrp_24_ref, "a", %progbits
@ gFontgrp_24: region-different data, JP 0x0857b824 read from funcmap-aligned code literal (US 0x08589edc); incbin baserom.gba
	.global gFontgrp_24
gFontgrp_24:
	.incbin "baserom.gba", 0x57B824, 0x48
