/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_16_ref, "a", %progbits
	.global gFontgrp_16
gFontgrp_16:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x5340
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBC0
	.4byte 0x0003BBB0
	.4byte 0x0000EAB0
	.4byte 0x0000EFB0
	.4byte 0x0000ECEC
	.4byte 0x0000EFBB
	.4byte 0x0000EECF
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00000EF0
	.4byte 0x000003AC
	.4byte 0x000000F0
	.4byte 0x00000000
