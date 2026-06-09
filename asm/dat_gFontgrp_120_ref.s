	.section .rodata.dat_gFontgrp_120_ref, "a", %progbits
@ gFontgrp_120: region-different data, JP 0x0857a7d4 read from funcmap-aligned code literal (US 0x0858b9dc); incbin baserom.gba
	.global gFontgrp_120
gFontgrp_120:
	.incbin "baserom.gba", 0x57A7D4, 0x48
