/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_357_ref, "a", %progbits
	.global gFontgrp_357
gFontgrp_357:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x828
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000FCFC
	.4byte 0x0003ABAB
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EAAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0003ABAB
	.4byte 0x0000FCFC
	.4byte 0x00000000
