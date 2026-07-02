/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_278_ref, "a", %progbits
	.global gFontgrp_278
gFontgrp_278:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x7B30
	.4byte 0x00000B94
	.4byte 0x00000000
	.4byte 0x00002C2C
	.4byte 0x000BFFFC
	.4byte 0x0002EEEC
	.4byte 0x0002C0CB
	.4byte 0x000BFCB0
	.4byte 0x000B2CB0
	.4byte 0x000B2EFF
	.4byte 0x000BFCB0
	.4byte 0x000B2CB0
	.4byte 0x000B2EFC
	.4byte 0x000BFFBC
	.4byte 0x000B2FBB
	.4byte 0x000B2CB0
	.4byte 0x000BFCB0
	.4byte 0x000B2CB0
