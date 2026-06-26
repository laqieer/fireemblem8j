#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_339_ref, \"a\", %progbits\n"
"\t.global gFontgrp_339\n"
"gFontgrp_339:\n"
"\t.4byte frontier_df4_uistuff_003_57CC64 + 0x120\n"
"\t.4byte 0x000007FA\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FEB\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000EBEB\n"
"\t.4byte 0x0000EBEB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00000000\n"
);
