/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_238_ref, "a", %progbits
	.global gFontgrp_238
gFontgrp_238:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x4260
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000002C
	.4byte 0x000002F8
	.4byte 0x000000A0
	.4byte 0x000002F0
	.4byte 0x00000BAF
	.4byte 0x00000B0A
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B80
	.4byte 0x000002E8
	.4byte 0x000000BC
