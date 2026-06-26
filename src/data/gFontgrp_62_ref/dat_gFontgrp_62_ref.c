#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_62_ref, \"a\", %progbits\n"
"\t.global gFontgrp_62\n"
"gFontgrp_62:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x360\n"
"\t.4byte 0x00000783\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000300C\n"
"\t.4byte 0x00000000\n"
);
