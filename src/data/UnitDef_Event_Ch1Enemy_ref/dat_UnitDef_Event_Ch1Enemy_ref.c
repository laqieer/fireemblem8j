#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch1Enemy word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_Ch1_0[];
extern struct REDA REDA_Ch1_1[];
extern struct REDA REDA_Ch1_2[];
extern struct REDA REDA_Ch1_3[];
extern struct REDA REDA_Ch1_4[];
extern struct REDA REDA_Ch1_5[];
extern struct REDA REDA_Ch1_6[];

SECTION(".rodata.dat_UnitDef_Event_Ch1Enemy_ref") struct UnitDefinition UnitDef_Event_Ch1Enemy[] =
{
    { .charIndex=0x46, .classIndex=0x9, .leaderCharIndex=0x46, .allegiance=0x2, .level=0x4, .xPosition=0x2, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_0, .items={0x14}, .ai={0x3, 0x3, 0x9} },
    { .charIndex=0x80, .classIndex=0x4E, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0x1, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_1, .items={0x14}, .ai={0x0, 0x3, 0x9} },
    { .charIndex=0x80, .classIndex=0x4E, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0x2, .yPosition=0x9, .redaCount=0x2, .redas=REDA_Ch1_2, .items={0x14}, .ai={0x0, 0x3, 0x9} },
    { .charIndex=0x80, .classIndex=0x4E, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x2, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_3, .items={0x14}, .ai={0x3, 0x12, 0x1} },
    { .charIndex=0x80, .classIndex=0x3F, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0x1, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_4, .items={0x1F}, .ai={0x0, 0x0, 0x1} },
    { .charIndex=0x80, .classIndex=0x3F, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0x2, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_5, .items={0x1F}, .ai={0x0, 0x0, 0x1} },
    { .charIndex=0x80, .classIndex=0x3F, .leaderCharIndex=0x46, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0x2, .yPosition=0x9, .redaCount=0x1, .redas=REDA_Ch1_6, .items={0x1F}, .ai={0x0, 0x12, 0x1} },
    {0},
};
