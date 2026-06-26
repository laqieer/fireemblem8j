#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_264_ref, \"a\", %progbits\n"
"\t.global gFontgrp_264\n"
"gFontgrp_264:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x288\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x000002FF\n"
"\t.4byte 0x000000BA\n"
"\t.4byte 0x00003FB0\n"
"\t.4byte 0x00002A2C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x000002CB\n"
"\t.4byte 0x00002ACB\n"
"\t.4byte 0x00003F8B\n"
);
