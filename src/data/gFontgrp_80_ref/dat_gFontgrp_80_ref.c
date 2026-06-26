#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_80_ref, \"a\", %progbits\n"
"\t.global gFontgrp_80\n"
"gFontgrp_80:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1CF8\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x00000FB0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FB0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x0000EBBB\n"
"\t.4byte 0x0000EEFB\n"
"\t.4byte 0x00003BAC\n"
"\t.4byte 0x00000CF0\n"
"\t.4byte 0x00000000\n"
);
