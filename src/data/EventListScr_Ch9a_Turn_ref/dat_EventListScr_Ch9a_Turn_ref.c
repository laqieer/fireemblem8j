#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch9a_Turn.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch9a_Turn_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch9a_Turn\n"
"EventListScr_Ch9a_Turn:\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0xD8\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x24\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x3C\n"
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0xC\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x6C\n"
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x54\n"
"\t.4byte 0x00000004\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x84\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte data_08A661E0 + 0x9C\n"
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventScr_Ch9A_4\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x00000000\n"
);
