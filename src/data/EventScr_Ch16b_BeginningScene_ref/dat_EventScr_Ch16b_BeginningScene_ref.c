#include "global.h"

/* De-pointered from data/residual/EventScr_Ch16b_BeginningScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch16b_BeginningScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch16b_BeginningScene\n"
"EventScr_Ch16b_BeginningScene:\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_042_91C230\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A69704\n"  /* coincidental const into fn: raw */
"\t.4byte 0x000E0229\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A69AB8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x001F2A21\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A69D90\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A69DB8\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A69DE0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000120\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0891C438\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000A40\n"
);
