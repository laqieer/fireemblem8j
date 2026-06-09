	.section .rodata.dat_gFontgrp_96_ref, "a", %progbits
@ gFontgrp_96: region-different data, JP 0x08579e8c read from funcmap-aligned code literal (US 0x0858b31c); incbin baserom.gba
	.global gFontgrp_96
gFontgrp_96:
	.incbin "baserom.gba", 0x579E8C, 0x48
