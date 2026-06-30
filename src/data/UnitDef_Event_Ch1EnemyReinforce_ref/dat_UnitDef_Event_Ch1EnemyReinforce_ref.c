#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch1EnemyReinforce word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_Ch1_7[];
extern struct REDA REDA_Ch1_8[];
extern struct REDA REDA_Ch1_9[];

SECTION(".rodata.dat_UnitDef_Event_Ch1EnemyReinforce_ref") struct UnitDefinition UnitDef_Event_Ch1EnemyReinforce[] =
{
    { .charIndex=0x80, .classIndex=0x3F, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_7, .items={0x1F}, .ai={0x0, 0x0, 0x9} },
    { .charIndex=0x83, .classIndex=0x4E, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0xE, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_8, .items={0x14}, .ai={0x0, 0x0, 0x9} },
    { .charIndex=0x80, .classIndex=0x3F, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_9, .items={0x1F}, .ai={0x0, 0x0, 0x9} },
    {0},
};
