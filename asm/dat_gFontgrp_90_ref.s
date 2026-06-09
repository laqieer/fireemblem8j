	.section .rodata.dat_gFontgrp_90_ref, "a", %progbits
@ gFontgrp_90: region-different data, JP 0x08579db4 read from funcmap-aligned code literal (US 0x0858b16c); incbin baserom.gba
	.global gFontgrp_90
gFontgrp_90:
	.incbin "baserom.gba", 0x579DB4, 0x48
