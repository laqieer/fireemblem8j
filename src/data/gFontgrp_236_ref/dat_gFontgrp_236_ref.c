#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_236_ref, \"a\", %progbits\n"
"\t.global gFontgrp_236\n"
"gFontgrp_236:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x510\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00002E0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002CBB\n"
"\t.4byte 0x000000BB\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x0000002C\n"
);
