/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_350_ref, "a", %progbits
	.global gFontgrp_350
gFontgrp_350:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x750
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000033C0
	.4byte 0x0000EEB0
	.4byte 0x0000EBAC
	.4byte 0x0000ECEB
	.4byte 0x000030EB
	.4byte 0x000000EB
	.4byte 0x000000EB
	.4byte 0x000030EB
	.4byte 0x0000ECEB
	.4byte 0x0000EBAC
	.4byte 0x00003EB0
	.4byte 0x000003C0
	.4byte 0x00000000
