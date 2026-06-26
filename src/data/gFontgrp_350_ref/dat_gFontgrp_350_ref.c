#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_350_ref, \"a\", %progbits\n"
"\t.global gFontgrp_350\n"
"gFontgrp_350:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0x750\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000033C0\n"
"\t.4byte 0x0000EEB0\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x000030EB\n"
"\t.4byte 0x000000EB\n"
"\t.4byte 0x000000EB\n"
"\t.4byte 0x000030EB\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x0000EBAC\n"
"\t.4byte 0x00003EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
