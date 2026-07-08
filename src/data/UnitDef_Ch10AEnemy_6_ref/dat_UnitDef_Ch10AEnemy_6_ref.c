#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AEnemy_6.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch10AEnemy_6_0[];
extern const u8 REDA_Ch10AEnemy_6_1[];
extern const u8 REDA_Ch10AEnemy_6_2[];
SECTION(".rodata.dat_UnitDef_Ch10AEnemy_6_ref") struct UnitDefinition UnitDef_Ch10AEnemy_6[] =
{
    { .charIndex=0x43, .classIndex=0x23, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x3, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_6_0) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x4, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_6_1) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x2, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_6_2) },
    {0},
};
