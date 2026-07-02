/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_233_ref, "a", %progbits
	.global gFontgrp_233
gFontgrp_233:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x5A0
	.4byte 0x00000B8D
	.4byte 0x00000000
	.4byte 0x0000BF0B
	.4byte 0x0000B02C
	.4byte 0x0000B02C
	.4byte 0x0000B000
	.4byte 0x0000B000
	.4byte 0x0000BC2F
	.4byte 0x0000BC2C
	.4byte 0x0002EC2C
	.4byte 0x0002CB2C
	.4byte 0x0002CB2C
	.4byte 0x000B02EC
	.4byte 0x000B02EC
	.4byte 0x0000002C
	.4byte 0x000002FB
	.4byte 0x000BFF0B
