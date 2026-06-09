	.section .rodata.dat_gFontgrp_224_ref, "a", %progbits
@ gFontgrp_224: region-different data, JP 0x0859863c read from funcmap-aligned code literal (US 0x0858db1c); incbin baserom.gba
	.global gFontgrp_224
gFontgrp_224:
	.incbin "baserom.gba", 0x59863C, 0x48
