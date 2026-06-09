	.section .rodata.dat_gFontgrp_185_ref, "a", %progbits
@ gFontgrp_185: region-different data, JP 0x08595ffc read from funcmap-aligned code literal (US 0x0858d024); incbin baserom.gba
	.global gFontgrp_185
gFontgrp_185:
	.incbin "baserom.gba", 0x595FFC, 0x48
