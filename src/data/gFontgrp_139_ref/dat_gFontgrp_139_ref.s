/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_139_ref, "a", %progbits
	.global gFontgrp_139
gFontgrp_139:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0x360
	.4byte 0x00000893
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003030
	.4byte 0x0000E0EC
	.4byte 0x0000EFAB
	.4byte 0x0003AAFC
	.4byte 0x0000EFAB
	.4byte 0x0000ECFC
	.4byte 0x0000EBAB
	.4byte 0x0000EBFC
	.4byte 0x0000EFAB
	.4byte 0x0000EFBB
	.4byte 0x0000EFBB
	.4byte 0x0000DBAB
	.4byte 0x00003CFC
	.4byte 0x00000000
