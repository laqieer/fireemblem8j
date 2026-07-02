/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_117_ref, "a", %progbits
	.global gFontgrp_117
gFontgrp_117:
	.4byte frontier_df3_fontgrp_se_005_580B1C + 0x2D0
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBC0
	.4byte 0x0003BBB0
	.4byte 0x0000CEC0
	.4byte 0x00000300
	.4byte 0x00003EC0
	.4byte 0x0000EEF0
	.4byte 0x000399EC
	.4byte 0x0003BBEC
	.4byte 0x0003BBDB
	.4byte 0x0003BBBB
	.4byte 0x0000CECC
	.4byte 0x00000300
	.4byte 0x00000000
