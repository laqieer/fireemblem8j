#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch12AEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_078_90E58C[];
SECTION(".rodata.dat_UnitDef_Ch12AEnemy_3_ref") struct UnitDefinition UnitDef_Ch12AEnemy_3[] =
{
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0x1D, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0x90), .items={0x14,0x1C,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0x1D, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0x98), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x13, .yPosition=0x1D, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_078_90E58C + 0xA0), .items={0x1B,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
