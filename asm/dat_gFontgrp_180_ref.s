	.section .rodata.dat_gFontgrp_180_ref, "a", %progbits
@ gFontgrp_180: region-different data, JP 0x08595e94 read from funcmap-aligned code literal (US 0x0858cebc); incbin baserom.gba
	.global gFontgrp_180
gFontgrp_180:
	.incbin "baserom.gba", 0x595E94, 0x48
