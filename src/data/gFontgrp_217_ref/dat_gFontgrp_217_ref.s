/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_217_ref, "a", %progbits
	.global gFontgrp_217
gFontgrp_217:
	.4byte frontier_df4_uistuff_017_59A574 + 0x870
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002FB
	.4byte 0x00000BAF
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000000
