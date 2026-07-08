#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch9AMixed_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch9AMixed_1_SETH[];
SECTION(".rodata.dat_UnitDef_Ch9AMixed_1_ref") struct UnitDefinition UnitDef_Ch9AMixed_1[] =
{
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x16, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AMixed_1_SETH) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x15, .yPosition=0x6 },
    { .charIndex=0xA7, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x16, .yPosition=0x8 },
    {0},
};
