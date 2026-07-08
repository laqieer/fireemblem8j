#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch9AEnemy_8.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch9AEnemy_8_0[];
extern const u8 REDA_Ch9AEnemy_8_1[];
extern const u8 REDA_Ch9AEnemy_8_2[];
extern const u8 REDA_Ch9AEnemy_8_3[];
SECTION(".rodata.dat_UnitDef_Ch9AEnemy_8_ref") struct UnitDefinition UnitDef_Ch9AEnemy_8[] =
{
    { .charIndex=0x83, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x2, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AEnemy_8_0), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0A,0x00} },
    { .charIndex=0x85, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x1, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AEnemy_8_1), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0A,0x00} },
    { .charIndex=0x84, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x3, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AEnemy_8_2), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0A,0x00} },
    { .charIndex=0x12, .classIndex=0x47, .allegiance=0x2, .level=0x1, .xPosition=0x2, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch9AEnemy_8_3), .items={0x15,0x5E,0x00,0x00}, .ai={0x00,0x03,0x10,0x00} },
    {0},
};
