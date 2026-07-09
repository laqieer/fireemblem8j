/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_246_ref, "a", %progbits
	.global gFontgrp_246
gFontgrp_246:
	.4byte dat_gFontgrp_0859A0AC_ref + 0x48
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x00002EC0
	.4byte 0x00000BFC
	.4byte 0x000002E8
	.4byte 0x0000BF80
	.4byte 0x00002BFF
	.4byte 0x00000EAA
	.4byte 0x00002FFC
	.4byte 0x00003AAB
	.4byte 0x0000200B
	.4byte 0x0000000B
	.4byte 0x00000AAC
	.4byte 0x00000FF0
