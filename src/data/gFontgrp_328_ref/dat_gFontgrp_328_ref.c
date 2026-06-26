#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_328_ref, \"a\", %progbits\n"
"\t.global gFontgrp_328\n"
"gFontgrp_328:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x6C0\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003030\n"
"\t.4byte 0x0000EFEC\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FEC\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x0000EBF0\n"
"\t.4byte 0x0000EBEC\n"
"\t.4byte 0x00003BEB\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x000003F0\n"
"\t.4byte 0x00000000\n"
);
