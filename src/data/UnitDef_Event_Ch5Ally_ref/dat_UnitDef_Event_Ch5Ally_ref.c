#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch5Ally word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern struct REDA REDA_Event_Ch5Ally_ARTUR[];
extern struct REDA REDA_Event_Ch5Ally_COLM[];
extern struct REDA REDA_Event_Ch5Ally_EIRIKA[];
extern struct REDA REDA_Event_Ch5Ally_FRANZ[];
extern struct REDA REDA_Event_Ch5Ally_GILLIAM[];
extern struct REDA REDA_Event_Ch5Ally_NATASHA[];
extern struct REDA REDA_Event_Ch5Ally_NEIMI[];
extern struct REDA REDA_Event_Ch5Ally_SETH[];
extern struct REDA REDA_Event_Ch5Ally_VANESSA[];

SECTION(".rodata.dat_UnitDef_Event_Ch5Ally_ref") struct UnitDefinition UnitDef_Event_Ch5Ally[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x5, .xPosition=0x6, .yPosition=0x11, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_EIRIKA, .items={0x9, 0x6C} },
    { .charIndex=0xD, .classIndex=0x4A, .level=0x1, .xPosition=0x5, .yPosition=0x12, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_NATASHA, .items={0x4C, 0x6C} },
    { .charIndex=0x9, .classIndex=0xD, .level=0x5, .xPosition=0x5, .yPosition=0x10, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_COLM, .items={0x1, 0x6B} },
    { .charIndex=0x6, .classIndex=0x48, .level=0x2, .xPosition=0x4, .yPosition=0x13, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_VANESSA, .items={0x15, 0x6C} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x5, .xPosition=0x3, .yPosition=0x10, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_GILLIAM, .items={0x14, 0x6C} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .xPosition=0x6, .yPosition=0x13, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_FRANZ, .items={0x1, 0x14} },
    { .charIndex=0x8, .classIndex=0x1A, .level=0x1, .xPosition=0x7, .yPosition=0x12, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_NEIMI, .items={0x2D, 0x6C} },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x4, .yPosition=0x11, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_SETH, .items={0x3, 0x17} },
    { .charIndex=0x13, .classIndex=0x44, .level=0x1, .xPosition=0x3, .yPosition=0x12, .redaCount=0x1, .redas=REDA_Event_Ch5Ally_ARTUR, .items={0x3F} },
    {0},
};
