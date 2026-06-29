#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch19AAlly_5.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_022_915038[];
SECTION(".rodata.dat_UnitDef_Ch19AAlly_5_ref") struct UnitDefinition UnitDef_Ch19AAlly_5[] =
{
    { .charIndex=0x19, .classIndex=0x4B, .level=0x1, .xPosition=0x7, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_022_915038 + 0x8) },
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x6, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_022_915038 + 0x10) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x8, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_022_915038 + 0x18) },
    { .charIndex=0x1E, .classIndex=0x3C, .level=0x1, .xPosition=0x6, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_022_915038 + 0x20) },
    { .charIndex=0xB, .classIndex=0x1B, .level=0x1, .xPosition=0x8, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_022_915038 + 0x28) },
    {0},
};
