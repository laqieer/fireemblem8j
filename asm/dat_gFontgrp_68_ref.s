	.section .rodata.dat_gFontgrp_68_ref, "a", %progbits
@ gFontgrp_68: region-different data, JP 0x0857bf2c read from funcmap-aligned code literal (US 0x0858ab3c); incbin baserom.gba
	.global gFontgrp_68
gFontgrp_68:
	.incbin "baserom.gba", 0x57BF2C, 0x48
