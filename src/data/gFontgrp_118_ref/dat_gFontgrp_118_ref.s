/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_118_ref, "a", %progbits
	.global gFontgrp_118
gFontgrp_118:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1E60
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00003EFC
	.4byte 0x0000EAAB
	.4byte 0x00003EFC
	.4byte 0x00003EFB
	.4byte 0x0000EAAC
	.4byte 0x00003EF0
	.4byte 0x00000EAC
	.4byte 0x00003AFB
	.4byte 0x0000EEFB
	.4byte 0x0000F3AC
	.4byte 0x000000F0
	.4byte 0x00000000
