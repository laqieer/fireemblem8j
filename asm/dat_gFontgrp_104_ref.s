	.section .rodata.dat_gFontgrp_104_ref, "a", %progbits
@ gFontgrp_104: region-different data, JP 0x08579fac read from funcmap-aligned code literal (US 0x0858b55c); incbin baserom.gba
	.global gFontgrp_104
gFontgrp_104:
	.incbin "baserom.gba", 0x579FAC, 0x48
