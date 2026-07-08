#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch9AMixed_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch9AMixed_0_LARACHEL[];
extern const u8 REDA_Ch9AMixed_0_DOZLA[];
extern const u8 REDA_Ch9AMixed_0_RENNAC[];
extern const u8 REDA_Ch9AMixed_0_EIRIKA[];
extern const u8 REDA_Ch9AMixed_0_SETH[];
SECTION(".rodata.dat_UnitDef_Ch9AMixed_0_ref") struct UnitDefinition UnitDef_Ch9AMixed_0[] =
{
    { .charIndex=0x19, .classIndex=0x4B, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_0_LARACHEL) },
    { .charIndex=0x1A, .classIndex=0x43, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x11, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_0_DOZLA) },
    { .charIndex=0x1C, .classIndex=0x33, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x13, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_0_RENNAC) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0xF, .yPosition=0x3, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_0_EIRIKA) },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x10, .yPosition=0x3, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_0_SETH) },
    {0},
};
