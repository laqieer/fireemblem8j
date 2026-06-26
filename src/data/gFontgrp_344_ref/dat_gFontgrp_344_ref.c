#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_344_ref, \"a\", %progbits\n"
"\t.global gFontgrp_344\n"
"gFontgrp_344:\n"
"\t.4byte frontier_df3_fontgrp_se_005_580B1C + 0x630\n"
"\t.4byte 0x00000781\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000FC0\n"
"\t.4byte 0x00000000\n"
);
