#include "global.h"

/* De-pointered from data/residual/EventScr_Ch21b_BeginningScene.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch21b_BeginningScene_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch21b_BeginningScene\n"
"EventScr_Ch21b_BeginningScene:\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A6B58C\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch21BEnemy_1\n"
"\t.4byte 0x00002A24\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00000D40\n"
"\t.4byte 0x08087F19\n"  /* not a fe8u ptr slot: raw */
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_ConfigHardModeLoadUnitHard\n"
"\t.4byte 0x000D0540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000032\n"
);
