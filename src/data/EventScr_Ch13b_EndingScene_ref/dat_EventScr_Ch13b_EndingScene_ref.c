#include "global.h"

/* De-pointered from data/residual/EventScr_Ch13b_EndingScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch13b_EndingScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch13b_EndingScene\n"
"EventScr_Ch13b_EndingScene:\n"
"\t.4byte 0x7FFF1324\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x0000342A\n"
"\t.4byte 0x0000342C\n"
"\t.4byte 0x0000342B\n"
"\t.4byte 0x0D0E2628\n"
"\t.4byte 0x00002B22\n"
"\t.4byte 0x00012C41\n"
"\t.4byte frontier_df3_unitdef_b_033_9191E0 + 0x7AC\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x00012C41\n"
"\t.4byte frontier_df3_unitdef_b_033_9191E0 + 0x7AC\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x001E3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00321220\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xCC\n"
"\t.4byte 0x0AB31B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x0000342A\n"
"\t.4byte 0x0000342C\n"
"\t.4byte 0x0000342B\n"
"\t.4byte 0x00750229\n"
"\t.4byte 0x001B2A21\n"
"\t.4byte 0x00000120\n"
);
