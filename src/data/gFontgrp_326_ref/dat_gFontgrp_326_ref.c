#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_326_ref, \"a\", %progbits\n"
"\t.global gFontgrp_326\n"
"gFontgrp_326:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0x990\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003FF0\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00000ECC\n"
"\t.4byte 0x00003AB0\n"
"\t.4byte 0x0000EBF0\n"
"\t.4byte 0x0000EBEC\n"
"\t.4byte 0x00003BEB\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x000003F0\n"
"\t.4byte 0x00000000\n"
);
