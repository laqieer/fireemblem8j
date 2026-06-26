#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch10AEnemy_6.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch10AEnemy_6_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch10AEnemy_6\n"
"UnitDef_Ch10AEnemy_6:\n"
"\t.4byte 0x0D002343\n"
"\t.4byte 0x01000783\n"
"\t.4byte data_0890C9BC + 0xF4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x01000784\n"
"\t.4byte data_0890C9BC + 0xFC\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x01000782\n"
"\t.4byte data_0890C9BC + 0x104\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
