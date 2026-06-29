#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch12AEnemy_5.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_078_90E58C[];
SECTION(".rodata.dat_UnitDef_Ch12AEnemy_5_ref") struct UnitDefinition UnitDef_Ch12AEnemy_5[] =
{
    { .charIndex=0xB3, .classIndex=0x5B, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0x118), .items={0xB1,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xB3, .classIndex=0x5B, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0x120), .items={0xB1,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xB3, .classIndex=0x5B, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0x128), .items={0xB1,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
