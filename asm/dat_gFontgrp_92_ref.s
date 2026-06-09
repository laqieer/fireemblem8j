	.section .rodata.dat_gFontgrp_92_ref, "a", %progbits
@ gFontgrp_92: region-different data, JP 0x08579dfc read from funcmap-aligned code literal (US 0x0858b1fc); incbin baserom.gba
	.global gFontgrp_92
gFontgrp_92:
	.incbin "baserom.gba", 0x579DFC, 0x48
