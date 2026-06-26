#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_361_ref, \"a\", %progbits\n"
"\t.global gFontgrp_361\n"
"gFontgrp_361:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0xD8\n"
"\t.4byte 0x00000681\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x00000EFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00000EFC\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
