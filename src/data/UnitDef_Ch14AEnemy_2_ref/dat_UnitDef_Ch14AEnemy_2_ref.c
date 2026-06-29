#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch14AEnemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_000_90F678[];
SECTION(".rodata.dat_UnitDef_Ch14AEnemy_2_ref") struct UnitDefinition UnitDef_Ch14AEnemy_2[] =
{
    { .charIndex=0x80, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x16, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x990), .items={0x14,0x6A,0x00,0x00}, .ai={0x00,0x03,0x09,0x20} },
    { .charIndex=0x80, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x998), .items={0x1E,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x20} },
    { .charIndex=0x80, .classIndex=0x9, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_000_90F678 + 0x9A0), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x09,0x00} },
    {0},
};
