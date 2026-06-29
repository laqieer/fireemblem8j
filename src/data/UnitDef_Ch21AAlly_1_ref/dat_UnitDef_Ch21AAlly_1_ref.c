#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch21AAlly_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_023_91512C[];
SECTION(".rodata.dat_UnitDef_Ch21AAlly_1_ref") struct UnitDefinition UnitDef_Ch21AAlly_1[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0xC, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_023_91512C + 0xB90) },
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0xA, .yPosition=0x18, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_023_91512C + 0xB98) },
    { .charIndex=0xB, .classIndex=0x1B, .level=0x1, .xPosition=0xC, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_023_91512C + 0xBA8) },
    { .charIndex=0x19, .classIndex=0x4B, .level=0x1, .xPosition=0x9, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_023_91512C + 0xBB0) },
    { .charIndex=0x1E, .classIndex=0x3C, .level=0x1, .xPosition=0xB, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_023_91512C + 0xBB8) },
    {0},
};
