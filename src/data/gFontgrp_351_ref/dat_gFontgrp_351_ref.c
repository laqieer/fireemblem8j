#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_351_ref, \"a\", %progbits\n"
"\t.global gFontgrp_351\n"
"gFontgrp_351:\n"
"\t.4byte frontier_df4_uistuff_006_57E4DC + 0x288\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x00003BAC\n"
"\t.4byte 0x00000EAB\n"
"\t.4byte 0x000003FC\n"
"\t.4byte 0x00000000\n"
);
