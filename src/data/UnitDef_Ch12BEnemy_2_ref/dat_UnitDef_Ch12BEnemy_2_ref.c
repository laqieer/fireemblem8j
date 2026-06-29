#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch12BEnemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_030_918784[];
SECTION(".rodata.dat_UnitDef_Ch12BEnemy_2_ref") struct UnitDefinition UnitDef_Ch12BEnemy_2[] =
{
    { .charIndex=0xB3, .classIndex=0x5B, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_030_918784 + 0x388), .items={0xB1,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xB3, .classIndex=0x5B, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_030_918784 + 0x390), .items={0xB1,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_030_918784 + 0x398), .items={0x18,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    {0},
};
