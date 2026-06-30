#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch7Ally word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_Ch6_1[];
extern struct REDA REDA_Ch6_2[];
extern struct REDA REDA_Ch6_3[];
extern struct REDA REDA_Ch6_4[];
extern struct REDA REDA_Ch7_0[];
extern struct REDA REDA_Ch7_1[];
extern struct REDA REDA_Ch7_2[];
extern struct REDA REDA_Ch7_3[];

SECTION(".rodata.dat_UnitDef_Event_Ch7Ally_ref") struct UnitDefinition UnitDef_Event_Ch7Ally[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x7, .yPosition=0x11, .redaCount=0x1, .redas=REDA_Ch6_1, .items={0x9, 0x6C} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x5, .yPosition=0x10, .redaCount=0x1, .redas=REDA_Ch6_2, .items={0x14, 0x6C} },
    { .charIndex=0x8, .classIndex=0x1A, .level=0x1, .yPosition=0x11, .redaCount=0x1, .redas=REDA_Ch6_3, .items={0x2D, 0x6C} },
    { .charIndex=0x5, .classIndex=0x45, .level=0x3, .yPosition=0x10, .redaCount=0x1, .redas=REDA_Ch6_4, .items={0x4B} },
    { .charIndex=0xA, .classIndex=0x3F, .level=0x4, .yPosition=0x12, .redaCount=0x1, .redas=REDA_Ch7_0, .items={0x1F, 0x28} },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .yPosition=0x10, .redaCount=0x1, .redas=REDA_Ch7_1, .items={0x3, 0x17, 0x6C} },
    { .charIndex=0x9, .classIndex=0xD, .level=0x2, .yPosition=0x13, .redaCount=0x1, .redas=REDA_Ch7_2, .items={0x1, 0x6B} },
    { .charIndex=0x6, .classIndex=0x48, .level=0x2, .yPosition=0x12, .redaCount=0x1, .redas=REDA_Ch7_3, .items={0x15, 0x6C} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .yPosition=0x11, .items={0x1, 0x14, 0x6C} },
    { .charIndex=0x13, .classIndex=0x44, .level=0x1, .yPosition=0x13, .items={0x3F} },
    {0},
};
