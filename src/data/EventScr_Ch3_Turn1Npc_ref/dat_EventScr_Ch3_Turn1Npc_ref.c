#include "global.h"

/* De-pointered from data/residual/EventScr_Ch3_Turn1Npc.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch3_Turn1Npc_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch3_Turn1Npc\n"
"EventScr_Ch3_Turn1Npc:\n"
"\t.4byte 0x00002620\n"
"\t.4byte 0x000F0E20\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch3NPC\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x000F1220\n"
"\t.4byte 0x00093B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x09521B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_08A6378C + 0x38\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00002F48\n"
"\t.4byte 0x04020009\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_08A6378C + 0x58\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
