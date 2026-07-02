/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_46_ref, "a", %progbits
	.global gFontgrp_46
gFontgrp_46:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0x990
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003FFC
	.4byte 0x0000EAAB
	.4byte 0x0000EFFC
	.4byte 0x0000EC00
	.4byte 0x0000E700
	.4byte 0x00003B00
	.4byte 0x000039FC
	.4byte 0x00000EEC
	.4byte 0x00000DB0
	.4byte 0x00000EC0
	.4byte 0x00003B00
	.4byte 0x00003C00
	.4byte 0x00000000
