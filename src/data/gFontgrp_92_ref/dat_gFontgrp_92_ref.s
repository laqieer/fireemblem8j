/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_92_ref, "a", %progbits
	.global gFontgrp_92
gFontgrp_92:
	.4byte frontier_df3_fontgrp_se_002_57FACC + 0x48
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x00000FB0
	.4byte 0x00003BBC
	.4byte 0x00003EAB
	.4byte 0x0000E67C
	.4byte 0x00003AAB
	.4byte 0x00000EFC
	.4byte 0x00003AAC
	.4byte 0x00003BFB
	.4byte 0x00000FFB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
