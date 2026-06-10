	.section .rodata.dat_gFontgrp_64_ref, "a", %progbits
@ gFontgrp_64: region-different data, JP 0x0857bee4 read from funcmap-aligned code literal (US 0x0858aa1c); incbin baserom.gba
	.global gFontgrp_64
gFontgrp_64:
	.incbin "data/residual/gFontgrp_64.bin"
