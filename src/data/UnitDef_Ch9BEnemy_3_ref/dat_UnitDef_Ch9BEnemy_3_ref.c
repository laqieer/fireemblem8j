#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch9BEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_025_9163BC[];
SECTION(".rodata.dat_UnitDef_Ch9BEnemy_3_ref") struct UnitDefinition UnitDef_Ch9BEnemy_3[] =
{
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x18, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_025_9163BC + 0x30C), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x18, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_025_9163BC + 0x314), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x18, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_025_9163BC + 0x31C), .items={0x1C,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
