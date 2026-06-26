#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_76_ref, \"a\", %progbits\n"
"\t.global gFontgrp_76\n"
"gFontgrp_76:\n"
"\t.4byte frontier_df3_fontgrp_se_005_580B1C + 0xD8\n"
"\t.4byte 0x0000088E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00003EF0\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003EF0\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000EFFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000EFFC\n"
"\t.4byte 0x0000EF6C\n"
"\t.4byte 0x0000EFB0\n"
"\t.4byte 0x0000DBC0\n"
"\t.4byte 0x00003F00\n"
"\t.4byte 0x00000000\n"
);
