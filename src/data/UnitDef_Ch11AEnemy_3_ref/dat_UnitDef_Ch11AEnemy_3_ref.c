#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch11AEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_077_90DB94[];
SECTION(".rodata.dat_UnitDef_Ch11AEnemy_3_ref") struct UnitDefinition UnitDef_Ch11AEnemy_3[] =
{
    { .charIndex=0xAD, .classIndex=0x55, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x198), .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x04,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x1A0), .items={0x18,0x00,0x00,0x00}, .ai={0x00,0x04,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x1A8), .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
