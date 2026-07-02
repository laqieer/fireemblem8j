/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_324_ref, "a", %progbits
	.global gFontgrp_324
gFontgrp_324:
	.4byte frontier_df3_fontgrp_se_003_57FD0C + 0xD8
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00000EF0
	.4byte 0x00000EAC
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x00003EBC
	.4byte 0x0000EAAB
	.4byte 0x00003FFC
	.4byte 0x00000000
