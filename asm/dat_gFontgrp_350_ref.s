	.section .rodata.dat_gFontgrp_350_ref, "a", %progbits
@ gFontgrp_350: region-different data, JP 0x0857db04 read from funcmap-aligned code literal (US 0x0859028c); incbin baserom.gba
	.global gFontgrp_350
gFontgrp_350:
	.incbin "baserom.gba", 0x57DB04, 0x48
