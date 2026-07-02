/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_273_ref, "a", %progbits
	.global gFontgrp_273
gFontgrp_273:
	.4byte frontier_df4_uistuff_014_598E64 + 0xD8
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x00000BBC
	.4byte 0x00002EEF
	.4byte 0x00002CBE
	.4byte 0x00002C2C
	.4byte 0x00002C2C
	.4byte 0x00002C2E
	.4byte 0x00002C2F
	.4byte 0x00002C2E
	.4byte 0x00002C2C
	.4byte 0x00002C2C
	.4byte 0x0000B82C
