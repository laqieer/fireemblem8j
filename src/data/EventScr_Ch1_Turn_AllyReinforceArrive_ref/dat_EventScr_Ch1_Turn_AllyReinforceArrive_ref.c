#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1_Turn_AllyReinforceArrive.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch1_Turn_AllyReinforceArrive_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch1_Turn_AllyReinforceArrive\n"
"EventScr_Ch1_Turn_AllyReinforceArrive:\n"
"\t.4byte 0x00541220\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Event_Ch1AllyReinforce\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00043B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08F11B20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch1Tut_GilliamBattle\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
