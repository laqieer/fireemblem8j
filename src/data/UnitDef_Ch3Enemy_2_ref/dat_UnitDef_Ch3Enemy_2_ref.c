#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch3Enemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch3Enemy_2_CAELLACH[];
extern const u8 REDA_Ch3Enemy_2_RIEV[];
extern const u8 REDA_Ch3Enemy_2_VALTER[];
SECTION(".rodata.dat_UnitDef_Ch3Enemy_2_ref") struct UnitDefinition UnitDef_Ch3Enemy_2[] =
{
    { .charIndex=0x57, .classIndex=0x2B, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch3Enemy_2_RIEV },
    { .charIndex=0x53, .classIndex=0x11, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xF, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch3Enemy_2_CAELLACH },
    { .charIndex=0x43, .classIndex=0x23, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xD, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch3Enemy_2_VALTER },
    {0},
};
