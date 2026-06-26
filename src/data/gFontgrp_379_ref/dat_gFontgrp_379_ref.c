#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_379_ref, \"a\", %progbits\n"
"\t.global gFontgrp_379\n"
"gFontgrp_379:\n"
"\t.4byte frontier_df4_uistuff_016_59A2EC + 0x1F8\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0000BFE0\n"
"\t.4byte 0x0000BAB0\n"
"\t.4byte 0x0000B0B8\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000380E\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00000E00\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002C\n"
);
