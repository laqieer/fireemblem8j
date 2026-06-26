#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_275_ref, \"a\", %progbits\n"
"\t.global gFontgrp_275\n"
"gFontgrp_275:\n"
"\t.4byte frontier_df4_uistuff_017_59A574 + 0x168\n"
"\t.4byte 0x00000A93\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002FFFF\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002FFFF\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002C00B\n"
"\t.4byte 0x0002FFFF\n"
"\t.4byte 0x0002C00B\n"
);
