#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_PrologueValterGroup word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_PrologueValterGroup0[];
extern struct REDA REDA_PrologueValterGroup2[];
extern struct REDA REDA_PrologueValterGroup3[];

SECTION(".rodata.dat_UnitDef_Event_PrologueValterGroup_ref") struct UnitDefinition UnitDef_Event_PrologueValterGroup[] =
{
    { .charIndex=0x45, .classIndex=0x23, .allegiance=0x2, .level=0x5, .xPosition=0xE, .yPosition=0x5, .redaCount=0x2, .redas=REDA_PrologueValterGroup0, .items={0x17} },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x4, .redaCount=0x1, .redas=REDA_PrologueValterGroup2 },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x6, .redaCount=0x1, .redas=REDA_PrologueValterGroup3 },
    {0},
};
