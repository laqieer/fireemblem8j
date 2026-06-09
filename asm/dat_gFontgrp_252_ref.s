	.section .rodata.dat_gFontgrp_252_ref, "a", %progbits
@ gFontgrp_252: region-different data, JP 0x085944fc read from funcmap-aligned code literal (US 0x0858e2fc); incbin baserom.gba
	.global gFontgrp_252
gFontgrp_252:
	.incbin "baserom.gba", 0x5944FC, 0x48
