#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch8Ally_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_076_90B4DC[];
SECTION(".rodata.dat_UnitDef_Ch8Ally_0_ref") struct UnitDefinition UnitDef_Ch8Ally_0[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x7, .yPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x324), .items={0x78,0x16,0x6D,0x00} },
    { .charIndex=0x10, .classIndex=0x5, .level=0x9, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x32C), .items={0x03,0x1C,0x6C,0x00} },
    { .charIndex=0x11, .classIndex=0x5, .level=0x8, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x334), .items={0x03,0x16,0x6C,0x00} },
    {0},
};
