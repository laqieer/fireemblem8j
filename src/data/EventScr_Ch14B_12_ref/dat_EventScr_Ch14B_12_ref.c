#include "global.h"

/* De-pointered from data/residual/EventScr_Ch14B_12.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch14B_12_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch14B_12\n"
"EventScr_Ch14B_12:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch14BEnemy_8\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch14BEnemy_9\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x80\n"
"\t.4byte 0x00010F23\n"
"\t.4byte 0x00100221\n"
"\t.4byte 0x00010F20\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00100229\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
