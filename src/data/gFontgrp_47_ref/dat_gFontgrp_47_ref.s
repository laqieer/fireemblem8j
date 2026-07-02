/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_47_ref, "a", %progbits
	.global gFontgrp_47
gFontgrp_47:
	.4byte frontier_df3_fontgrp_se_006_5814AC + 0x4C8
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003F0
	.4byte 0x00003DAC
	.4byte 0x0000EAF0
	.4byte 0x00003F00
	.4byte 0x000003F0
	.4byte 0x00003DAC
	.4byte 0x0000EAF0
	.4byte 0x00003F00
	.4byte 0x000003F0
	.4byte 0x00003DAC
	.4byte 0x0000EAF0
	.4byte 0x00003F00
	.4byte 0x00000000
