/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_271_ref, "a", %progbits
	.global gFontgrp_271
gFontgrp_271:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x1E60
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x0000B2C0
	.4byte 0x00002FFF
	.4byte 0x00000AEA
	.4byte 0x000002C0
	.4byte 0x00002ECB
	.4byte 0x00000BFE
	.4byte 0x000002E8
	.4byte 0x000002C0
	.4byte 0x000002FC
	.4byte 0x00002FEB
	.4byte 0x00003ACB
	.4byte 0x000020BE
