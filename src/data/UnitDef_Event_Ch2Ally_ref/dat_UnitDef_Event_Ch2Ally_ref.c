#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_Ch2Ally.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_Ch2Ally_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_Ch2Ally\n"
"UnitDef_Event_Ch2Ally:\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x01000001\n"
"\t.4byte data_08908790 + 0x3C\n"
"\t.4byte 0x00006C09\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x01000000\n"
"\t.4byte data_08908790 + 0x44\n"
"\t.4byte 0x006C1701\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000504\n"
"\t.4byte 0x01000001\n"
"\t.4byte data_08908790 + 0x4C\n"
"\t.4byte 0x00006C01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x28000903\n"
"\t.4byte 0x01000000\n"
"\t.4byte data_08908790 + 0x54\n"
"\t.4byte 0x00006C14\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x18004505\n"
"\t.4byte 0x01000001\n"
"\t.4byte data_08908790 + 0x5C\n"
"\t.4byte 0x00006C4B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
