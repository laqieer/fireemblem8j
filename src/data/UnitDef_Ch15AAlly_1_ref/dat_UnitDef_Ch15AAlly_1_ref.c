#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch15AAlly_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_005_9109A8[];
SECTION(".rodata.dat_UnitDef_Ch15AAlly_1_ref") struct UnitDefinition UnitDef_Ch15AAlly_1[] =
{
    { .charIndex=0x1F, .classIndex=0x2D, .autolevel=0x1, .level=0xA, .yPosition=0x13, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_005_9109A8 + 0x118), .items={0x45,0x47,0x6C,0x00} },
    { .charIndex=0xF, .classIndex=0x1, .level=0xA, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_005_9109A8 + 0x120), .items={0x78,0x16,0x6D,0x00} },
    { .charIndex=0x1D, .classIndex=0x35, .autolevel=0x1, .level=0xA, .yPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_005_9109A8 + 0x128), .items={0x21,0x17,0x6C,0x00} },
    {0},
};
