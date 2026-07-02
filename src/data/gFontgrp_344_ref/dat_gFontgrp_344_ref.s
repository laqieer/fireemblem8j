/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_344_ref, "a", %progbits
	.global gFontgrp_344
gFontgrp_344:
	.4byte frontier_df3_fontgrp_se_005_580B1C + 0x630
	.4byte 0x00000781
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FC0
	.4byte 0x00000EC0
	.4byte 0x0000FEFC
	.4byte 0x0000EAAC
	.4byte 0x0000FEFC
	.4byte 0x00000EC0
	.4byte 0x00000FC0
	.4byte 0x00000000
