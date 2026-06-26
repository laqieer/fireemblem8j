#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_92_ref, \"a\", %progbits\n"
"\t.global gFontgrp_92\n"
"gFontgrp_92:\n"
"\t.4byte frontier_df3_fontgrp_se_002_57FACC + 0x48\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x00000FB0\n"
"\t.4byte 0x00003BBC\n"
"\t.4byte 0x00003EAB\n"
"\t.4byte 0x0000E67C\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00000EFC\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00000FFB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00000000\n"
);
