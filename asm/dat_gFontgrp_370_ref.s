	.section .rodata.dat_gFontgrp_370_ref, "a", %progbits
@ gFontgrp_370: region-different data, JP 0x08595984 read from funcmap-aligned code literal (US 0x0859082c); incbin baserom.gba
	.global gFontgrp_370
gFontgrp_370:
	.incbin "baserom.gba", 0x595984, 0x48
