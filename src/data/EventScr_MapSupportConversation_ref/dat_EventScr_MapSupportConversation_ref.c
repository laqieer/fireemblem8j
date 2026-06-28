#include "global.h"

/* De-pointered from data/residual/EventScr_MapSupportConversation.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_MapSupportConversation_ref, \"a\", %progbits\n"
"\t.global EventScr_MapSupportConversation\n"
"EventScr_MapSupportConversation:\n"
"\t.4byte 0x00031020\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0xFFFF1220\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00320620\n"
"\t.4byte 0xFFFF1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x080A3A40\n"
"\t.4byte 0x0000005A\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
