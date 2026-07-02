/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_86_ref, "a", %progbits
	.global gFontgrp_86
gFontgrp_86:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x6CD8
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000F0
	.4byte 0x000003AC
	.4byte 0x00000FFC
	.4byte 0x00003AAB
	.4byte 0x00000EFC
	.4byte 0x000003B0
	.4byte 0x00003EEC
	.4byte 0x0000EB3B
	.4byte 0x00003C0C
	.4byte 0x00000000
