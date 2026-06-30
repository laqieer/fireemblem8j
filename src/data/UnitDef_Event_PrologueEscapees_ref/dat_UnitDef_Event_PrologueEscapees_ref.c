#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_PrologueEscapees word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_PrologueEscapees0[];
extern struct REDA REDA_PrologueEscapees2[];
extern struct REDA REDA_PrologueEscapees4[];

SECTION(".rodata.dat_UnitDef_Event_PrologueEscapees_ref") struct UnitDefinition UnitDef_Event_PrologueEscapees[] =
{
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x9, .yPosition=0x3, .redaCount=0x2, .redas=REDA_PrologueEscapees0, .items={0x3} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .xPosition=0x9, .yPosition=0x3, .redaCount=0x2, .redas=REDA_PrologueEscapees2 },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x6, .yPosition=0x5, .redaCount=0x1, .redas=REDA_PrologueEscapees4 },
    {0},
};
