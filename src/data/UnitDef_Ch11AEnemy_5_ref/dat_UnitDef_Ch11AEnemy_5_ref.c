#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch11AEnemy_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch11AEnemy_5_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch11AEnemy_5\n"
"UnitDef_Ch11AEnemy_5:\n"
"\t.4byte 0x0D002343\n"
"\t.4byte 0x01000288\n"
"\t.4byte data_0890E394 + 0xC4\n"
"\t.4byte 0x0000001A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F66\n"
"\t.4byte 0x01000287\n"
"\t.4byte data_0890E394 + 0xCC\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F67\n"
"\t.4byte 0x01000289\n"
"\t.4byte data_0890E394 + 0xD4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
