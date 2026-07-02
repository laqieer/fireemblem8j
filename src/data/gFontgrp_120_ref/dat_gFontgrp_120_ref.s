/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_120_ref, "a", %progbits
	.global gFontgrp_120
gFontgrp_120:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0xD8
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000030
	.4byte 0x000000EC
	.4byte 0x00000FEC
	.4byte 0x00003AEB
	.4byte 0x0000EDAC
	.4byte 0x0000EFAC
	.4byte 0x0000EF6C
	.4byte 0x0000ECEB
	.4byte 0x0000ECEB
	.4byte 0x0000ECEC
	.4byte 0x0003B0EC
	.4byte 0x0000C030
	.4byte 0x00000000
