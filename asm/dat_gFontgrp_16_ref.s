	.section .rodata.dat_gFontgrp_16_ref, "a", %progbits
@ gFontgrp_16: region-different data, JP 0x0857c244 read from funcmap-aligned code literal (US 0x08589c9c); incbin baserom.gba
	.global gFontgrp_16
gFontgrp_16:
	.incbin "data/residual/gFontgrp_16.bin"
