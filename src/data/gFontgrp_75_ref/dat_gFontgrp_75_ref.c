#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_75_ref, \"a\", %progbits\n"
"\t.global gFontgrp_75\n"
"gFontgrp_75:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x510\n"
"\t.4byte 0x00000682\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00003AFC\n"
"\t.4byte 0x00003AC0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003AC\n"
"\t.4byte 0x00000FAC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00000000\n"
);
