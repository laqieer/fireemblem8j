/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_334_ref, "a", %progbits
	.global gFontgrp_334
gFontgrp_334:
	.4byte dat_gFontgrp_0857E32C_ref + 0x48
	.4byte 0x000007FA
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003C0
	.4byte 0x00000EB0
	.4byte 0x00000EAC
	.4byte 0x00000EBC
	.4byte 0x00000EB0
	.4byte 0x00003EBC
	.4byte 0x0000EAAB
	.4byte 0x0000FFFF
	.4byte 0x00000000
