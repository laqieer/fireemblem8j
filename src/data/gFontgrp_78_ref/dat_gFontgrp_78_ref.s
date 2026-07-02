/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_78_ref, "a", %progbits
	.global gFontgrp_78
gFontgrp_78:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0x288
	.4byte 0x0000098E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003030
	.4byte 0x0000ECEC
	.4byte 0x0003ABAB
	.4byte 0x0003EFEC
	.4byte 0x000EAAEC
	.4byte 0x0003BFAC
	.4byte 0x000EAAEC
	.4byte 0x0003BFEB
	.4byte 0x0003BEEC
	.4byte 0x0003BBEC
	.4byte 0x0003BCEC
	.4byte 0x0003ACDB
	.4byte 0x0000F03F
	.4byte 0x00000000
