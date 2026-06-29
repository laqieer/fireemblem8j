#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch4Enemy_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch4Enemy_1_0[];
extern const u8 REDA_Ch4Enemy_1_1[];
extern const u8 REDA_Ch4Enemy_1_2[];
extern const u8 REDA_Ch4Enemy_1_3[];
SECTION(".rodata.dat_UnitDef_Ch4Enemy_1_ref") struct UnitDefinition UnitDef_Ch4Enemy_1[] =
{
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0x2, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_1_0, .items={0xAE,0x6C,0x00,0x00}, .ai={0x00,0x00,0x0C,0x20} },
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0x2, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_1_1, .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0x2, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_1_2, .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0x2, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Enemy_1_3, .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
