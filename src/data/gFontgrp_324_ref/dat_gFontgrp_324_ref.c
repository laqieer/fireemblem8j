#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_324_ref, \"a\", %progbits\n"
"\t.global gFontgrp_324\n"
"gFontgrp_324:\n"
"\t.4byte frontier_df3_fontgrp_se_003_57FD0C + 0xD8\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00003EBC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x00003FFC\n"
"\t.4byte 0x00000000\n"
);
