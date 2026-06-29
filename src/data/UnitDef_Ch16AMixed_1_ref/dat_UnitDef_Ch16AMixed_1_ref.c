#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16AMixed_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_013_911E38[];
SECTION(".rodata.dat_UnitDef_Ch16AMixed_1_ref") struct UnitDefinition UnitDef_Ch16AMixed_1[] =
{
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x7, .yPosition=0x8, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_013_911E38 + 0xBC) },
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x7, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_013_911E38 + 0xD4) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x8, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_013_911E38 + 0xDC) },
    { .charIndex=0xFB, .classIndex=0x72, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x4, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_013_911E38 + 0xE4) },
    {0},
};
