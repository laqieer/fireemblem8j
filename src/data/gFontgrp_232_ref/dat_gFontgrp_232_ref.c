#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_232_ref, \"a\", %progbits\n"
"\t.global gFontgrp_232\n"
"gFontgrp_232:\n"
"\t.4byte frontier_df4_uistuff_020_59BFE4 + 0x288\n"
"\t.4byte 0x00000B8E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0002FF2C\n"
"\t.4byte 0x0000B0BF\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x000BFFEC\n"
"\t.4byte 0x0002C02C\n"
"\t.4byte 0x0002C0BC\n"
"\t.4byte 0x000BFFEF\n"
"\t.4byte 0x0002C02C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002EC2C\n"
"\t.4byte 0x0002C02C\n"
"\t.4byte 0x0000B02F\n"
);
