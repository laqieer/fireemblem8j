#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch5_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch5_Location_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch5_Location\n"
"EventListScr_Ch5_Location:\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x12C\n"
"\t.4byte 0x00160102\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x142\n"
"\t.4byte 0x00170A06\n"
"\t.4byte 0x00080006\n"
"\t.4byte EventScr_Ch5_0\n"
"\t.4byte 0x00100A0C\n"
"\t.4byte 0x00080005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0020090C\n"
"\t.4byte 0x00090006\n"
"\t.4byte EventScr_Ch5_1\n"
"\t.4byte 0x0010130C\n"
"\t.4byte 0x00090005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x0020120C\n"
"\t.4byte 0x000A0006\n"
"\t.4byte EventScr_Ch5_2\n"
"\t.4byte 0x00100605\n"
"\t.4byte 0x000A0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200505\n"
"\t.4byte 0x000B0006\n"
"\t.4byte EventScr_Ch5_3\n"
"\t.4byte 0x00100105\n"
"\t.4byte 0x000B0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200005\n"
"\t.4byte 0x00000000\n"
);
