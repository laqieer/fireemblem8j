#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch4Enemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch4Enemy_2_0[];
extern const u8 REDA_Ch4Enemy_2_1[];
extern const u8 REDA_Ch4Enemy_2_2[];
SECTION(".rodata.dat_UnitDef_Ch4Enemy_2_ref") struct UnitDefinition UnitDef_Ch4Enemy_2[] =
{
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_2_0, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_2_1, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x12,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0xE, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_2_2, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
