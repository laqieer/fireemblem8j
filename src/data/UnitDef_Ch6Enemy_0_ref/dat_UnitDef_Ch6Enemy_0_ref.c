#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch6Enemy_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch6Enemy_0_0[];
extern const u8 REDA_Ch6Enemy_0_1[];
extern const u8 REDA_Ch6Enemy_0_2[];
SECTION(".rodata.dat_UnitDef_Ch6Enemy_0_ref") struct UnitDefinition UnitDef_Ch6Enemy_0[] =
{
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x7, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch6Enemy_0_0), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x01,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x6, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch6Enemy_0_1), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x00,0x01,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x6, .yPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch6Enemy_0_2), .items={0x1C,0x14,0x00,0x00}, .ai={0x00,0x00,0x01,0x00} },
    {0},
};
