/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_97_ref, "a", %progbits
	.global gFontgrp_97
gFontgrp_97:
	.4byte frontier_df3_fontgrp_se_006_5814AC + 0x2D0
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0003F000
	.4byte 0x000EEC00
	.4byte 0x000EEB0C
	.4byte 0x0003FBFB
	.4byte 0x0000EABB
	.4byte 0x00003BFB
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00000EFB
	.4byte 0x00000EEC
	.4byte 0x00000330
	.4byte 0x00000000
