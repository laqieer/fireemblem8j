#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AEnemy_4.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch10AEnemy_4_0[];
extern const u8 REDA_Ch10AEnemy_4_1[];
extern const u8 REDA_Ch10AEnemy_4_2[];
extern const u8 REDA_Ch10AEnemy_4_3[];
SECTION(".rodata.dat_UnitDef_Ch10AEnemy_4_ref") struct UnitDefinition UnitDef_Ch10AEnemy_4[] =
{
    { .charIndex=0xA8, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0x1A, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_4_0), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0x1A, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_4_1), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0x1A, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_4_2), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x13, .yPosition=0x1A, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_4_3), .items={0x2E,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
