	.section .rodata.dat_gFontgrp_256_ref, "a", %progbits
@ gFontgrp_256: region-different data, JP 0x0859458c read from funcmap-aligned code literal (US 0x0858e41c); incbin baserom.gba
	.global gFontgrp_256
gFontgrp_256:
	.incbin "data/residual/gFontgrp_256.bin"
