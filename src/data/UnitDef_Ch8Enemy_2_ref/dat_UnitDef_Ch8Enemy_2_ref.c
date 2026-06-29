#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch8Enemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_076_90B4DC[];
SECTION(".rodata.dat_UnitDef_Ch8Enemy_2_ref") struct UnitDefinition UnitDef_Ch8Enemy_2[] =
{
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x8, .yPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x34C), .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x8, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x354), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0x8, .yPosition=0x17, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x35C), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
