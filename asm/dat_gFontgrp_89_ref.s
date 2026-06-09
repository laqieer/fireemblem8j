	.section .rodata.dat_gFontgrp_89_ref, "a", %progbits
@ gFontgrp_89: region-different data, JP 0x08579d6c read from funcmap-aligned code literal (US 0x0858b124); incbin baserom.gba
	.global gFontgrp_89
gFontgrp_89:
	.incbin "baserom.gba", 0x579D6C, 0x48
