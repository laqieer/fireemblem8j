#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch10AEnemy_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch10AEnemy_4_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch10AEnemy_4\n"
"UnitDef_Ch10AEnemy_4:\n"
"\t.4byte 0x550005A8\n"
"\t.4byte 0x01000693\n"
"\t.4byte data_0890C9BC + 0x64\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550005A8\n"
"\t.4byte 0x01000693\n"
"\t.4byte data_0890C9BC + 0x6C\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550005A8\n"
"\t.4byte 0x01000693\n"
"\t.4byte data_0890C9BC + 0x74\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x0D001DA8\n"
"\t.4byte 0x01000693\n"
"\t.4byte data_0890C9BC + 0x7C\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
