#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch2Ally word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 REDA_Event_Ch2Ally_EIRIKA[];
extern const u8 REDA_Event_Ch2Ally_SETH[];
extern const u8 REDA_Event_Ch2Ally_FRANZ[];
extern const u8 REDA_Event_Ch2Ally_GILLIAM[];
extern const u8 REDA_Event_Ch2Ally_MOULDER[];

SECTION(".rodata.dat_UnitDef_Event_Ch2Ally_ref") struct UnitDefinition UnitDef_Event_Ch2Ally[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Event_Ch2Ally_EIRIKA), .items={0x9, 0x6C} },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Event_Ch2Ally_SETH), .items={0x1, 0x17, 0x6C} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .xPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Event_Ch2Ally_FRANZ), .items={0x1, 0x6C} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x5, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Event_Ch2Ally_GILLIAM), .items={0x14, 0x6C} },
    { .charIndex=0x5, .classIndex=0x45, .level=0x3, .xPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Event_Ch2Ally_MOULDER), .items={0x4B, 0x6C} },
    {0},
};
