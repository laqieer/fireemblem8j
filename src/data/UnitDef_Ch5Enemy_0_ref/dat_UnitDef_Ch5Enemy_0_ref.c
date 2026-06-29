#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5Enemy_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch5Enemy_0_0[];
extern const u8 REDA_Ch5Enemy_0_1[];
extern const u8 REDA_Ch5Enemy_0_2[];
extern const u8 REDA_Ch5Enemy_0_3[];
extern const u8 REDA_Ch5Enemy_0_4[];
extern const u8 REDA_Ch5Enemy_0_5[];
extern const u8 REDA_Ch5Enemy_0_6[];
SECTION(".rodata.dat_UnitDef_Ch5Enemy_0_ref") struct UnitDefinition UnitDef_Ch5Enemy_0[] =
{
    { .charIndex=0x4A, .classIndex=0x9, .allegiance=0x2, .level=0x8, .xPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_0, .items={0x1C,0x00,0x00,0x00}, .ai={0x03,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x6, .xPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_1, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_2, .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_3, .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x6, .xPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_4, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_5, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_0_6, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
