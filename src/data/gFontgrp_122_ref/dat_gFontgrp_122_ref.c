#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_122_ref, \"a\", %progbits\n"
"\t.global gFontgrp_122\n"
"gFontgrp_122:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x168\n"
"\t.4byte 0x00000793\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x00000000\n"
);
