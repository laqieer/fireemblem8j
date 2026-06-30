#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10BMixed_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch10BMixed_0_0[];
extern struct REDA REDAs_UnitDef_Ch10BMixed_0_1[];
extern struct REDA REDAs_UnitDef_Ch10BMixed_0_2[];
SECTION(".rodata.dat_UnitDef_Ch10BMixed_0_ref") struct UnitDefinition UnitDef_Ch10BMixed_0[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0xA, .xPosition=0x5, .yPosition=0x10 },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x6, .yPosition=0x10 },
    { .charIndex=0x19, .classIndex=0x4B, .autolevel=0x1, .allegiance=0x1, .level=0xA, .xPosition=0x9, .yPosition=0x9, .redaCount=0x3, .redas=REDAs_UnitDef_Ch10BMixed_0_0 },
    { .charIndex=0x1A, .classIndex=0x43, .autolevel=0x1, .allegiance=0x1, .level=0xA, .xPosition=0x9, .yPosition=0x8, .redaCount=0x2, .redas=REDAs_UnitDef_Ch10BMixed_0_1 },
    { .charIndex=0x1C, .classIndex=0x33, .autolevel=0x1, .allegiance=0x1, .level=0xA, .xPosition=0x9, .yPosition=0x7, .redaCount=0x2, .redas=REDAs_UnitDef_Ch10BMixed_0_2 },
    {0},
};
