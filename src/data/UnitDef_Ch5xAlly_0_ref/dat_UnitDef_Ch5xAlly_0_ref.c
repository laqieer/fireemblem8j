#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5xAlly_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_074_909DE8[];
SECTION(".rodata.dat_UnitDef_Ch5xAlly_0_ref") struct UnitDefinition UnitDef_Ch5xAlly_0[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0xC, .yPosition=0x8 },
    { .charIndex=0x11, .classIndex=0x5, .level=0x1, .xPosition=0xE, .yPosition=0x8 },
    { .charIndex=0x10, .classIndex=0x5, .level=0x1, .xPosition=0x8, .yPosition=0x3, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_074_909DE8 + 0x1F4) },
    {0},
};
