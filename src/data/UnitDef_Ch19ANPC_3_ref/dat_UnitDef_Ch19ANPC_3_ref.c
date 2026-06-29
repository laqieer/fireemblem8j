#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch19ANPC_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_019_913958[];
SECTION(".rodata.dat_UnitDef_Ch19ANPC_3_ref") struct UnitDefinition UnitDef_Ch19ANPC_3[] =
{
    { .charIndex=0xC8, .classIndex=0x7A, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x8, .yPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_019_913958 + 0xE04) },
    { .charIndex=0xCD, .classIndex=0x9, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x9, .yPosition=0xC, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_019_913958 + 0xE0C) },
    { .charIndex=0xCD, .classIndex=0x9, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x8, .yPosition=0xC, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_019_913958 + 0xE1C) },
    { .charIndex=0xCD, .classIndex=0xB, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x9, .yPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_019_913958 + 0xE2C) },
    {0},
};
