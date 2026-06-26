#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_349_ref, \"a\", %progbits\n"
"\t.global gFontgrp_349\n"
"gFontgrp_349:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0xBD0\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x00003BAC\n"
"\t.4byte 0x00000EAB\n"
"\t.4byte 0x000003FC\n"
"\t.4byte 0x00000000\n"
);
