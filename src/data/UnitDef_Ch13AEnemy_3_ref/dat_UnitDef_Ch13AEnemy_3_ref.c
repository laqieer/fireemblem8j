#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch13AEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch13AEnemy_3_0[];
extern const u8 REDA_Ch13AEnemy_3_1[];
extern const u8 REDA_Ch13AEnemy_3_2[];
extern const u8 REDA_Ch13AEnemy_3_3[];
extern const u8 REDA_Ch13AEnemy_3_4[];
extern const u8 REDA_Ch13AEnemy_3_5[];
extern const u8 REDA_Ch13AEnemy_3_6[];
extern const u8 REDA_Ch13AEnemy_3_7[];
extern const u8 REDA_Ch13AEnemy_3_8[];
extern const u8 REDA_Ch13AEnemy_3_9[];
SECTION(".rodata.dat_UnitDef_Ch13AEnemy_3_ref") struct UnitDefinition UnitDef_Ch13AEnemy_3[] =
{
    { .charIndex=0x4F, .classIndex=0x27, .autolevel=0x1, .allegiance=0x2, .level=0x5, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_0), .items={0x3A,0x42,0x4C,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_1), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_2), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_3), .items={0x22,0x63,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x41, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_4), .items={0x1F,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_5), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0xC, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_6), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x40, .autolevel=0x1, .allegiance=0x2, .level=0x2, .yPosition=0x7, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_7), .items={0x2B,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x25, .autolevel=0x1, .allegiance=0x2, .level=0xB, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_8), .items={0x38,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA9, .classIndex=0x25, .autolevel=0x1, .allegiance=0x2, .level=0xB, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13AEnemy_3_9), .items={0x38,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
