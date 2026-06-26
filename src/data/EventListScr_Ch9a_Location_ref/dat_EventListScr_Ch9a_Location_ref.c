#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch9a_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch9a_Location_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch9a_Location\n"
"EventListScr_Ch9a_Location:\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x14E\n"
"\t.4byte 0x00170201\n"
"\t.4byte 0x00080006\n"
"\t.4byte EventScr_Ch9A_2\n"
"\t.4byte 0x00100B01\n"
"\t.4byte 0x00080005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200A01\n"
"\t.4byte 0x00090006\n"
"\t.4byte EventScr_Ch9A_3\n"
"\t.4byte 0x00100F0B\n"
"\t.4byte 0x00090005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200E0B\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x166\n"
"\t.4byte 0x00160501\n"
"\t.4byte 0x00000000\n"
);
