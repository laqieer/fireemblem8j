	.section .rodata.dat_gFontgrp_80_ref, "a", %progbits
@ gFontgrp_80: region-different data, JP 0x0857b044 read from funcmap-aligned code literal (US 0x0858ae9c); incbin baserom.gba
	.global gFontgrp_80
gFontgrp_80:
	.incbin "data/residual/gFontgrp_80.bin"
