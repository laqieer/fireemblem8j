#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch11BEnemy_4.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_028_9178F8[];
SECTION(".rodata.dat_UnitDef_Ch11BEnemy_4_ref") struct UnitDefinition UnitDef_Ch11BEnemy_4[] =
{
    { .charIndex=0x5E, .classIndex=0x64, .allegiance=0x2, .level=0x3, .yPosition=0x9, .itemDrop=0x1, .items={0x96,0x00,0x00,0x00}, .ai={0x00,0x12,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_028_9178F8 + 0x9A4), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_028_9178F8 + 0x9AC), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
