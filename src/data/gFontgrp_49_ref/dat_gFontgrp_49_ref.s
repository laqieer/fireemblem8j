/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_49_ref, "a", %progbits
	.global gFontgrp_49
gFontgrp_49:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0xA20
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00000DB0
	.4byte 0x00003BB0
	.4byte 0x00003BB0
	.4byte 0x0000EF6C
	.4byte 0x0000EFEC
	.4byte 0x00039AEC
	.4byte 0x0003BDAB
	.4byte 0x0000C3FF
	.4byte 0x00000000
