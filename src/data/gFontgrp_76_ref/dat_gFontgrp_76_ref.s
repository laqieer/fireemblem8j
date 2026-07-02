/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_76_ref, "a", %progbits
	.global gFontgrp_76
gFontgrp_76:
	.4byte frontier_df3_fontgrp_se_005_580B1C + 0xD8
	.4byte 0x0000088E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00003EF0
	.4byte 0x0000EAAC
	.4byte 0x00003EF0
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000EFFC
	.4byte 0x0003AAAB
	.4byte 0x0000EFFC
	.4byte 0x0000EF6C
	.4byte 0x0000EFB0
	.4byte 0x0000DBC0
	.4byte 0x00003F00
	.4byte 0x00000000
