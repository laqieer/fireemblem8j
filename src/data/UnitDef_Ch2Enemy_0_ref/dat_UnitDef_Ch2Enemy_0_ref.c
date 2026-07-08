#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch2Enemy_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch2Enemy_0_0[];
extern const u8 REDA_Ch2Enemy_0_1[];
extern const u8 REDA_Ch2Enemy_0_2[];
extern const u8 REDA_Ch2Enemy_0_3[];
extern const u8 REDA_Ch2Enemy_0_4[];
extern const u8 REDA_Ch2Enemy_0_5[];
SECTION(".rodata.dat_UnitDef_Ch2Enemy_0_ref") struct UnitDefinition UnitDef_Ch2Enemy_0[] =
{
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x9, .yPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_0), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x11,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x19, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_1), .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x47, .classIndex=0x41, .allegiance=0x2, .level=0x4, .xPosition=0xE, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_2), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x04,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x6, .yPosition=0xA, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_3), .items={0x1F,0x6C,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x7, .yPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_4), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8E, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0x2, .xPosition=0xE, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch2Enemy_0_5), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x11,0x09,0x00} },
    {0},
};
