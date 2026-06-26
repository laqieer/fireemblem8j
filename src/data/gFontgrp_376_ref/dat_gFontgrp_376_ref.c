#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_376_ref, \"a\", %progbits\n"
"\t.global gFontgrp_376\n"
"gFontgrp_376:\n"
"\t.4byte frontier_df4_uistuff_014_598E64 + 0x558\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000BB2C0\n"
"\t.4byte 0x000BB2C0\n"
"\t.4byte 0x000BB2C0\n"
"\t.4byte 0x0000BFFC\n"
"\t.4byte 0x0000BAE8\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000BC0B\n"
);
