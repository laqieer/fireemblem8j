#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_Ch5Ally.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_Ch5Ally_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_Ch5Ally\n"
"UnitDef_Event_Ch5Ally:\n"
"\t.4byte 0x28000201\n"
"\t.4byte 0x01000446\n"
"\t.4byte REDA_Event_Ch5Ally_EIRIKA\n"
"\t.4byte 0x00006C09\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08004A0D\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000485\n"
"\t.4byte REDA_Event_Ch5Ally_NATASHA\n"
"\t.4byte 0x00006C4C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x28000D09\n"
"\t.4byte 0x01000405\n"
"\t.4byte REDA_Event_Ch5Ally_COLM\n"
"\t.4byte 0x00006B01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x10004806\n"
"\t.4byte 0x010004C4\n"
"\t.4byte REDA_Event_Ch5Ally_VANESSA\n"
"\t.4byte 0x00006C15\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x28000903\n"
"\t.4byte 0x01000403\n"
"\t.4byte REDA_Event_Ch5Ally_GILLIAM\n"
"\t.4byte 0x00006C14\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000504\n"  /* coincidental const into fn: raw */
"\t.4byte 0x010004C6\n"
"\t.4byte REDA_Event_Ch5Ally_FRANZ\n"
"\t.4byte 0x00001401\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08001A08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000487\n"
"\t.4byte REDA_Event_Ch5Ally_NEIMI\n"
"\t.4byte 0x00006C2D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000444\n"
"\t.4byte REDA_Event_Ch5Ally_SETH\n"
"\t.4byte 0x00001703\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08004413\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000483\n"
"\t.4byte REDA_Event_Ch5Ally_ARTUR\n"
"\t.4byte 0x0000003F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
