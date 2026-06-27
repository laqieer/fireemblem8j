#include "global.h"

/* De-pointered from data/residual/EventScr_Ch20b_BeginningScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch20b_BeginningScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch20b_BeginningScene\n"
"EventScr_Ch20b_BeginningScene:\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_Ch21A_8\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0000006C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_UnitWarpOUT\n"
"\t.4byte 0x006C342F\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch21BEnemy_0\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x200\n"
"\t.4byte 0x000B0229\n"
"\t.4byte 0x000C0229\n"
"\t.4byte 0x000D0229\n"
"\t.4byte 0x00000120\n"
);
