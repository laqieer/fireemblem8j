#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch2_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventListScr_Ch2_Location_ref, \"a\", %progbits\n"
"\t.global EventListScr_Ch2_Location\n"
"EventListScr_Ch2_Location:\n"
"\t.4byte 0x00090006\n"
"\t.4byte EventScr_Ch2_Village1\n"
"\t.4byte 0x00100204\n"
"\t.4byte 0x00090005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200104\n"
"\t.4byte 0x000A0006\n"
"\t.4byte data_08A62808\n"
"\t.4byte 0x00100207\n"
"\t.4byte 0x000A0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200107\n"
"\t.4byte 0x000B0006\n"
"\t.4byte 0x08A62844\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00100C01\n"
"\t.4byte 0x000B0005\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00200B01\n"
"\t.4byte 0x0000000A\n"
"\t.4byte gUidebug_2 + 0x120\n"
"\t.4byte 0x00160705\n"
"\t.4byte 0x00000000\n"
);
