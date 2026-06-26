#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_273_ref, \"a\", %progbits\n"
"\t.global gFontgrp_273\n"
"gFontgrp_273:\n"
"\t.4byte frontier_df4_uistuff_014_598E64 + 0xD8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x00000BBC\n"
"\t.4byte 0x00002EEF\n"
"\t.4byte 0x00002CBE\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002C2E\n"
"\t.4byte 0x00002C2F\n"
"\t.4byte 0x00002C2E\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x0000B82C\n"
);
