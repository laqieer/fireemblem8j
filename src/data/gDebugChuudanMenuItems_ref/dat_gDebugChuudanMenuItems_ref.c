#include "global.h"

/* De-pointered from data/residual/gDebugChuudanMenuItems.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gDebugChuudanMenuItems_ref, \"a\", %progbits\n"
"\t.global gDebugChuudanMenuItems\n"
"gDebugChuudanMenuItems:\n"
"\t.4byte frontier_df4_misc_lo_001_0DC974 + 0x78\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000800\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte DebugChargeMenu_Draw + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugChargeMenu_Idle + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9EC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000900\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte DebugChargeMenu_Draw + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugChargeMenu_Idle + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
