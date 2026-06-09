	.section .rodata.dat_gFontgrp_42_ref, "a", %progbits
@ gFontgrp_42: region-different data, JP 0x0857c634 read from funcmap-aligned code literal (US 0x0858a3ec); incbin baserom.gba
	.global gFontgrp_42
gFontgrp_42:
	.incbin "baserom.gba", 0x57C634, 0x48
