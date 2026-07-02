/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_125_ref, "a", %progbits
	.global gFontgrp_125
gFontgrp_125:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x7B30
	.4byte 0x00000894
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000F3C
	.4byte 0x0000FBEC
	.4byte 0x0003A9AC
	.4byte 0x0000EFBB
	.4byte 0x0003FFFC
	.4byte 0x0003AAEC
	.4byte 0x0003BEAB
	.4byte 0x0003AAEC
	.4byte 0x0003BE6C
	.4byte 0x0003AAAB
	.4byte 0x0003BEEB
	.4byte 0x0003AAEF
	.4byte 0x0003FFF0
	.4byte 0x00000000
