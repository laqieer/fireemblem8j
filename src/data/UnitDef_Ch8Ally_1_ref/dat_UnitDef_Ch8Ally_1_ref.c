#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch8Ally_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_076_90B4DC[];
SECTION(".rodata.dat_UnitDef_Ch8Ally_1_ref") struct UnitDefinition UnitDef_Ch8Ally_1[] =
{
    { .charIndex=0x42, .classIndex=0x7, .level=0x1, .xPosition=0x13, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x364) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x8, .xPosition=0x13, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x36C) },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x14, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x374) },
    {0},
};
