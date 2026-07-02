/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_70_ref, "a", %progbits
	.global gFontgrp_70
gFontgrp_70:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0xB40
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000F3C
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x0000EEAB
	.4byte 0x0000F3FC
	.4byte 0x00000000
