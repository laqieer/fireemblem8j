/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_73_ref, "a", %progbits
	.global gFontgrp_73
gFontgrp_73:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0xC18
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000303C
	.4byte 0x0000ECEB
	.4byte 0x00003BAC
	.4byte 0x00003BAC
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x00003AEC
	.4byte 0x00003AEC
	.4byte 0x0000EB3B
	.4byte 0x00003C0C
	.4byte 0x00000000
