#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch18AMixed.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch18AMixed_0[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_1[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_2[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_3[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_4[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_5[];
extern struct REDA REDAs_UnitDef_Ch18AMixed_6[];
SECTION(".rodata.dat_UnitDef_Ch18AMixed_ref") struct UnitDefinition UnitDef_Ch18AMixed[] =
{
    { .charIndex=0xC0, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x1, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_0 },
    { .charIndex=0xF, .classIndex=0x1, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_1 },
    { .charIndex=0x1, .classIndex=0x2, .level=0x9, .yPosition=0x17, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_2 },
    { .charIndex=0x1E, .classIndex=0x3C, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_3 },
    { .charIndex=0xB, .classIndex=0x1B, .level=0x1, .yPosition=0x17, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_4 },
    { .charIndex=0x19, .classIndex=0x4B, .level=0x1, .yPosition=0x18, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_5 },
    { .charIndex=0x2, .classIndex=0x7, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=REDAs_UnitDef_Ch18AMixed_6 },
    {0},
};
