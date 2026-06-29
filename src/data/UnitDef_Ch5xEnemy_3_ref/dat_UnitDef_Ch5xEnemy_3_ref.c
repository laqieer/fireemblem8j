#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5xEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890A480[];
SECTION(".rodata.dat_UnitDef_Ch5xEnemy_3_ref") struct UnitDefinition UnitDef_Ch5xEnemy_3[] =
{
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x1, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x54) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x1, .yPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x5C) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x1, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x64) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x1, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x6C) },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x8, .yPosition=0x10, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x74) },
    {0},
};
