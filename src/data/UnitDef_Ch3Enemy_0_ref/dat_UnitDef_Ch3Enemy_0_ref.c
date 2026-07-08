#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch3Enemy_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch3Enemy_0_0[];
extern const u8 REDA_Ch3Enemy_0_1[];
extern const u8 REDA_Ch3Enemy_0_2[];
extern const u8 REDA_Ch3Enemy_0_3[];
extern const u8 REDA_Ch3Enemy_0_4[];
extern const u8 REDA_Ch3Enemy_0_5[];
extern const u8 REDA_Ch3Enemy_0_6[];
extern const u8 REDA_Ch3Enemy_0_7[];
extern const u8 REDA_Ch3Enemy_0_8[];
extern const u8 REDA_Ch3Enemy_0_9[];
SECTION(".rodata.dat_UnitDef_Ch3Enemy_0_ref") struct UnitDefinition UnitDef_Ch3Enemy_0[] =
{
    { .charIndex=0x48, .classIndex=0x41, .allegiance=0x2, .level=0x6, .xPosition=0xE, .yPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_0), .items={0x20,0x28,0x00,0x00}, .ai={0x03,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x7, .yPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_1), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x9, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_2), .items={0x28,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0xF, .yPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_3), .items={0x01,0x6F,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x19, .autolevel=0x1, .allegiance=0x2, .level=0x4, .xPosition=0xC, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_4), .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0xE, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_5), .items={0x20,0x6E,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0xD, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x9, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_6), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x4, .xPosition=0xE, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_7), .items={0x28,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x5, .yPosition=0x9, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_8), .items={0x1F,0x6A,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x7, .yPosition=0xB, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch3Enemy_0_9), .items={0x1F,0x69,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    {0},
};
