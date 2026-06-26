#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_77_ref, \"a\", %progbits\n"
"\t.global gFontgrp_77\n"
"gFontgrp_77:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x52F8\n"
"\t.4byte 0x00000895\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x0000FEF0\n"
"\t.4byte 0x0003AAEC\n"
"\t.4byte 0x0000FDBB\n"
"\t.4byte 0x0003AA7F\n"
"\t.4byte 0x0003BEEC\n"
"\t.4byte 0x000396FB\n"
"\t.4byte 0x0003AAFB\n"
"\t.4byte 0x0000FB3B\n"
"\t.4byte 0x0003A9FB\n"
"\t.4byte 0x00039EFB\n"
"\t.4byte 0x0000EB3B\n"
"\t.4byte 0x0003BEFB\n"
"\t.4byte 0x0003C3CC\n"
"\t.4byte 0x00000000\n"
);
