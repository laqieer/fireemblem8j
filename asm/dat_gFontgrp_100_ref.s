	.section .rodata.dat_gFontgrp_100_ref, "a", %progbits
@ gFontgrp_100: region-different data, JP 0x08579f1c read from funcmap-aligned code literal (US 0x0858b43c); incbin baserom.gba
	.global gFontgrp_100
gFontgrp_100:
	.incbin "baserom.gba", 0x579F1C, 0x48
