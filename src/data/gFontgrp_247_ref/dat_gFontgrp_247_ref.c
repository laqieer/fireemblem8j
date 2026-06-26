#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_247_ref, \"a\", %progbits\n"
"\t.global gFontgrp_247\n"
"gFontgrp_247:\n"
"\t.4byte frontier_df4_uistuff_014_598E64 + 0x438\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000B82C0\n"
"\t.4byte 0x000BBEC0\n"
"\t.4byte 0x0002BBFC\n"
"\t.4byte 0x00002BA8\n"
"\t.4byte 0x0000BF00\n"
"\t.4byte 0x00000BFF\n"
"\t.4byte 0x00000EAA\n"
"\t.4byte 0x00002FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x0000202C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x00002AAC\n"
"\t.4byte 0x00003FF8\n"
);
