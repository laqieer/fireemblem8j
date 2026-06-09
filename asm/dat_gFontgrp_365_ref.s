	.section .rodata.dat_gFontgrp_365_ref, "a", %progbits
@ gFontgrp_365: region-different data, JP 0x08596cec read from funcmap-aligned code literal (US 0x085906c4); incbin baserom.gba
	.global gFontgrp_365
gFontgrp_365:
	.incbin "baserom.gba", 0x596CEC, 0x48
