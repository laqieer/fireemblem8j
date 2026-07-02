/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_151_ref, "a", %progbits
	.global gFontgrp_151
gFontgrp_151:
	.4byte frontier_df3_fontgrp_se_003_57FD0C + 0x48
	.4byte 0x00000889
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000FFFC
	.4byte 0x0003AAAB
	.4byte 0x0000FEFC
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00003EF0
	.4byte 0x0000EAAC
	.4byte 0x00003EF0
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000FFFC
	.4byte 0x00000000
