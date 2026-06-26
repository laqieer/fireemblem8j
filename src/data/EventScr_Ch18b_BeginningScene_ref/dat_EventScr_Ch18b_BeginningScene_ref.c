#include "global.h"

/* De-pointered from data/residual/EventScr_Ch18b_BeginningScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch18b_BeginningScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch18b_BeginningScene\n"
"EventScr_Ch18b_BeginningScene:\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_047_91E280 + 0x3E8\n"
"\t.4byte 0x00030540\n"
"\t.4byte UnitDef_Ch19BNPC_1\n"
"\t.4byte 0x00040540\n"
"\t.4byte frontier_df3_unitdef_b_047_91E280\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A6A3E0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x000F2621\n"
"\t.4byte 0x000F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00111220\n"
"\t.4byte 0x00020540\n"
);
