#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch11AEnemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_077_90DB94[];
SECTION(".rodata.dat_UnitDef_Ch11AEnemy_2_ref") struct UnitDefinition UnitDef_Ch11AEnemy_2[] =
{
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x180), .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x188), .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xAA, .classIndex=0x52, .autolevel=0x1, .allegiance=0x2, .level=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_077_90DB94 + 0x190), .items={0xAD,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
