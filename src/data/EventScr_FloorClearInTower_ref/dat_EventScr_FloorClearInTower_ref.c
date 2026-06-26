#include "global.h"

/* De-pointered from data/residual/EventScr_FloorClearInTower.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_FloorClearInTower_ref, \"a\", %progbits\n"
"\t.global EventScr_FloorClearInTower\n"
"EventScr_FloorClearInTower:\n"
"\t.4byte 0x00041020\n"
"\t.4byte 0x00000D40\n"
"\t.4byte DisplayMapClearMapAnim + 0x1\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0xFFFFFFFF\n"
"\t.4byte 0x08BF1B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00070540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0007000C\n"
"\t.4byte 0xFFFF2A21\n"
"\t.4byte 0x00000D40\n"
"\t.4byte StartRetreatProcessing + 0x1\n"
"\t.4byte 0x00010920\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00320620\n"
"\t.4byte 0xFFFF2A23\n"
"\t.4byte 0x00000D40\n"
"\t.4byte UnlockPostgameAllyByEnemyCount + 0x1\n"
"\t.4byte 0x00010820\n"
"\t.4byte 0x00000120\n"
);
