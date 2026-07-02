/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_358_ref, "a", %progbits
	.global gFontgrp_358
gFontgrp_358:
	.4byte frontier_df4_uistuff_006_57E4DC + 0x1B0
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003FFC
	.4byte 0x0000DAAB
	.4byte 0x0000EFAC
	.4byte 0x0000EFAC
	.4byte 0x0000EFAC
	.4byte 0x0000EFAC
	.4byte 0x0000DAAC
	.4byte 0x00003FAC
	.4byte 0x000003AC
	.4byte 0x000003AC
	.4byte 0x00000EAB
	.4byte 0x000003FC
	.4byte 0x00000000
