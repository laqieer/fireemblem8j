#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_97_ref, \"a\", %progbits\n"
"\t.global gFontgrp_97\n"
"gFontgrp_97:\n"
"\t.4byte frontier_df3_fontgrp_se_006_5814AC + 0x2D0\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003F000\n"
"\t.4byte 0x000EEC00\n"
"\t.4byte 0x000EEB0C\n"
"\t.4byte 0x0003FBFB\n"
"\t.4byte 0x0000EABB\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00000EFB\n"
"\t.4byte 0x00000EEC\n"
"\t.4byte 0x00000330\n"
"\t.4byte 0x00000000\n"
);
