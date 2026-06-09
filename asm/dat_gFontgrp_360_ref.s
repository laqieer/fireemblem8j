	.section .rodata.dat_gFontgrp_360_ref, "a", %progbits
@ gFontgrp_360: region-different data, JP 0x0857e494 read from funcmap-aligned code literal (US 0x0859055c); incbin baserom.gba
	.global gFontgrp_360
gFontgrp_360:
	.incbin "baserom.gba", 0x57E494, 0x48
