/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_109_ref, "a", %progbits
	.global gFontgrp_109
gFontgrp_109:
	.4byte frontier_df3_fontgrp_se_002_57FACC + 0x168
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBF0
	.4byte 0x0003BAAC
	.4byte 0x0000FBF0
	.4byte 0x0000FEC0
	.4byte 0x0003AFBC
	.4byte 0x0000FAAB
	.4byte 0x00000EBC
	.4byte 0x000003B0
	.4byte 0x000003B0
	.4byte 0x00003EC0
	.4byte 0x0000EB00
	.4byte 0x00003C00
	.4byte 0x00000000
