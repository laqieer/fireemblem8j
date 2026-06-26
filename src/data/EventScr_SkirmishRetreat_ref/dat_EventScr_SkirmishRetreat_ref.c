#include "global.h"

/* De-pointered from data/residual/EventScr_SkirmishRetreat.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_SkirmishRetreat_ref, \"a\", %progbits\n"
"\t.global EventScr_SkirmishRetreat\n"
"EventScr_SkirmishRetreat:\n"
"\t.4byte 0x00041020\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x08BE1B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00070540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0007000C\n"
"\t.4byte 0x7FFF1324\n"
"\t.4byte 0x00041721\n"
"\t.4byte 0xFFFF2A21\n"
"\t.4byte 0x00001926\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000C41\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000D40\n"
"\t.4byte StartRetreatProcessing + 0x1\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
