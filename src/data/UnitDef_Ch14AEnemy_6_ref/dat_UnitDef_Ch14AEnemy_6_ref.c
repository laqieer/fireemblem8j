#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch14AEnemy_6.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_000_90F678[];
SECTION(".rodata.dat_UnitDef_Ch14AEnemy_6_ref") struct UnitDefinition UnitDef_Ch14AEnemy_6[] =
{
    { .charIndex=0x80, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xE, .xPosition=0x8, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x9E0), .items={0x16,0x00,0x00,0x00}, .ai={0x03,0x03,0x09,0x00} },
    { .charIndex=0x84, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xC, .xPosition=0x9, .yPosition=0xB, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x9E8), .items={0x95,0x00,0x00,0x00}, .ai={0x03,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xC, .xPosition=0xA, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x9F0), .items={0x14,0x00,0x00,0x00}, .ai={0x03,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x1B, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x9, .yPosition=0xB, .items={0x2F,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0xC, .xPosition=0x8, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x9F8), .items={0x28,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0xC, .xPosition=0xA, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0xA00), .items={0x28,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    {0},
};
