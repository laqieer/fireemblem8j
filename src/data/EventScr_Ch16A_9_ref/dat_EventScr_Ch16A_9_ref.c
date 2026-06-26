#include "global.h"

/* De-pointered from data/residual/EventScr_Ch16A_9.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch16A_9_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch16A_9\n"
"EventScr_Ch16A_9:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch16AEnemy_2\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch16AEnemy_3\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x1B132620\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch16AEnemy_4\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df3_unitdef_b_009_91187C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
