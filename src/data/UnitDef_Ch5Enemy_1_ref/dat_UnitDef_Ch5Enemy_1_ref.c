#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5Enemy_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch5Enemy_1_0[];
extern const u8 REDA_Ch5Enemy_1_1[];
extern const u8 REDA_Ch5Enemy_1_2[];
extern const u8 REDA_Ch5Enemy_1_3[];
extern const u8 REDA_Ch5Enemy_1_4[];
extern const u8 REDA_Ch5Enemy_1_5[];
extern const u8 REDA_Ch5Enemy_1_6[];
extern const u8 REDA_Ch5Enemy_1_7[];
extern const u8 REDA_Ch5Enemy_1_8[];
SECTION(".rodata.dat_UnitDef_Ch5Enemy_1_ref") struct UnitDefinition UnitDef_Ch5Enemy_1[] =
{
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_0, .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x19, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_1, .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0x6, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_2, .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x5, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_3, .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x19, .autolevel=0x1, .allegiance=0x2, .level=0x5, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_4, .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x5, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_5, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x19, .autolevel=0x1, .allegiance=0x2, .level=0x4, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_6, .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0x4, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_7, .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch5Enemy_1_8, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    {0},
};
