/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_253_ref, "a", %progbits
	.global gFontgrp_253
gFontgrp_253:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x3600
	.4byte 0x00000A82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0002E000
	.4byte 0x0002EC00
	.4byte 0x0000AC2C
	.4byte 0x00000BF8
	.4byte 0x000002A0
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x00002AAE
	.4byte 0x00003FF8
