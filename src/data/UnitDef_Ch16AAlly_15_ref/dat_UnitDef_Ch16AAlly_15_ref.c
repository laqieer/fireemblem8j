#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16AAlly_15.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_015_91206C[];
SECTION(".rodata.dat_UnitDef_Ch16AAlly_15_ref") struct UnitDefinition UnitDef_Ch16AAlly_15[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x7, .yPosition=0x9, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_015_91206C + 0x64) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x7, .yPosition=0x9, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_015_91206C + 0x7C) },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x7, .yPosition=0x9, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_015_91206C + 0x94) },
    {0},
};
